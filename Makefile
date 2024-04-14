build:
	docker compose stop && docker compose build
run:
	docker compose stop && docker compose up -d
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

migrate_local_db_to_prod:
	./scripts/migrate-db.sh

migrate_code_and_local_db:
	make deploy_only_code && make migrate_local_db_to_prod