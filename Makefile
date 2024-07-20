.PHONY: help build run stop remove npm_install compileFront watchFront migrate_code_to_remote_server sync_local_db sync_remote_db

help:
	@echo "Available commands:"
	@echo ""
	@echo "make build                     - Build the Docker images for the project."
	@echo "make run                       - Run the Docker containers for the project."
	@echo "make stop                      - Stop the Docker containers."
	@echo "make remove                    - Remove the Docker containers and networks."
	@echo "make npm_install               - Install Node.js dependencies."
	@echo "make compileFront              - Compile the frontend assets."
	@echo "make watchFront                - Watch and compile the frontend assets."
	@echo "make migrate_code_to_remote_server - Deploy the code to a remote server."
	@echo "make sync_local_db             - Sync the local database from the production database."
	@echo "make sync_remote_db            - Sync the production database from the local database."

build:
	docker compose stop && docker compose build
run:
	docker stop $$(docker ps -aq) && docker compose stop && docker compose up -d && make watchFront
stop:
	docker compose stop
remove:
	docker compose down
npm_install:
	docker compose run --rm node npm install
compileFront:
	docker compose run --rm node node_modules/.bin/webpack
watchFront:
	docker compose run --rm node node_modules/.bin/webpack --watch

migrate_code_to_remote_server:
	./scripts/deploy.sh

sync_local_db:
	./scripts/sync-local-db-from-production.sh
sync_remote_db:
	./scripts/sync-production-db-from-local.sh