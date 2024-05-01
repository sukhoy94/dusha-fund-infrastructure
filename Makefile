build:
	docker compose stop && docker compose build
run:
	docker stop $$(docker ps -aq) && docker compose stop && docker compose up -d && make watchFront
stop:
	docker compose stop
remove:
	docker compose down

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