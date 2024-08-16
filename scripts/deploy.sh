#!/bin/bash

# Get the directory of the script
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

# Load environment variables from .env file
source "$SCRIPT_DIR/.env"
# SSH connection
ssh -T $SSH_LOGIN@$SSH_SERVER <<EOF
    # Commands to run on the remote server
    cd domains/dusha-fund.com/public_html

    # Get current branch
    current_branch=\$(git rev-parse --abbrev-ref HEAD)
    echo "Current branch: \$current_branch"

    # Pull changes
    echo "Pulling changes..."
    git fetch --all && git pull

    echo "Changes pulled successfully."

    cd ~/domains/dusha-fund.com/public_html/wp-content/themes/dusha-wp-theme && npm install
EOF