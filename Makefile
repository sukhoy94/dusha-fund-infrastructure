build:
	docker compose stop && docker compose build
run:
	docker compose stop && docker compose up -d
stop:
	docker compose stop
remove:
	docker compose down