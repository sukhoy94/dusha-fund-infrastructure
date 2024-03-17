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