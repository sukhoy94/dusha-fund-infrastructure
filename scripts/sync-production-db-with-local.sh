#!/bin/bash

# Get the directory of the script
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

# Load environment variables from .env file
source "$SCRIPT_DIR/.env"

# Dump local MySQL database
echo "Dumping local database..."
dump_output=$(docker exec $MARIADB_CONTAINER_NAME mysqldump -u $LOCAL_DB_USER -p$LOCAL_DB_PASSWORD $LOCAL_DB_NAME --ignore-table=$LOCAL_DB_NAME.wp_users 2>&1)

# Check if dump command executed successfully
if [ $? -ne 0 ]; then
    echo "Error dumping local database:"
    echo "$dump_output"
    exit 1
fi

echo "$dump_output" > "$SCRIPT_DIR/database_dump.sql"

# Transfer the database dump file to the remote server
echo "Transferring database dump to remote server..."
scp "$SCRIPT_DIR/database_dump.sql" "$SSH_LOGIN@$SSH_SERVER:/tmp"

# Connect to SSH server and import the database dump
echo "Connecting to SSH server and importing database dump..."
ssh -T "$SSH_LOGIN@$SSH_SERVER" <<EOF
    # Import the database dump
    echo "Importing database dump..."
    mysql -h "$REMOTE_DB_HOST" -u "$REMOTE_DB_USER" -p"$REMOTE_DB_PASSWORD" "$REMOTE_DB_NAME" < /tmp/database_dump.sql

    # Check if import command executed successfully
    if [ $? -ne 0 ]; then
        echo "Error importing database dump"
        exit 1
    fi

    # Update URLs in wp_posts table
    echo "Updating URLs in wp_posts table..."
    mysql -h "$REMOTE_DB_HOST" -u "$REMOTE_DB_USER" -p"$REMOTE_DB_PASSWORD" "$REMOTE_DB_NAME" -e "UPDATE wp_posts SET post_content = REPLACE(post_content, 'localhost:8080', 'dusha-fund.com');"

    # Update URLs in wp_options table
    echo "Updating URLs in wp_options table..."
    mysql -h "$REMOTE_DB_HOST" -u "$REMOTE_DB_USER" -p"$REMOTE_DB_PASSWORD" "$REMOTE_DB_NAME" -e "UPDATE wp_options SET option_value = REPLACE(option_value, 'localhost:8080', 'dusha-fund.com') WHERE option_name IN ('siteurl', 'home');"

    echo "URLs updated in wp_posts and wp_options tables."

    # Remove the temporary dump file
    echo "Cleaning up..."
    rm /tmp/database_dump.sql
EOF

# Clean up local database dump file
echo "Cleaning up local database dump..."
rm "$SCRIPT_DIR/database_dump.sql"

echo "Migration complete!"