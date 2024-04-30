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

deploy_only_code:
	./scripts/deploy.sh

sync_production_db_with_local:
	./scripts/sync-production-db-with-local.sh

migrate_code_and_local_db:
	make deploy_only_code && make sync_production_db_with_local

