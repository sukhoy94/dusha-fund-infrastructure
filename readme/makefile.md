This README will guide you through the setup and usage of the project.

## Table of Contents

- [Prerequisites](#prerequisites)
- [Makefile Targets](#makefile-targets)
  - [`make help`](#make-help)
  - [`make build`](#make-build)
  - [`make run`](#make-run)
  - [`make stop`](#make-stop)
  - [`make remove`](#make-remove)
  - [`make npm_install`](#make-npm_install)
  - [`make compileFront`](#make-compilefront)
  - [`make watchFront`](#make-watchfront)
  - [`make migrate_code_to_remote_server`](#make-migrate_code_to_remote_server)
  - [`make sync_local_db`](#make-sync_local_db)
  - [`make sync_remote_db`](#make-sync_remote_db)
- [Usage](#usage)

## Prerequisites

- [Docker](https://www.docker.com/get-started)
- [Docker Compose](https://docs.docker.com/compose/install/)
- [Make](https://www.gnu.org/software/make/)

## Makefile Targets

### `make help`

``` 
make help
```

List all possible commands from the Makefile


### `make build`
Build the Docker images for the project.

```
make build
```

### `make run`
Run the Docker containers for the project.

```
make run
```
This command stops all running Docker containers, stops any containers defined in your docker-compose.yml file, starts the containers in detached mode, and then runs the watchFront target to watch for frontend changes.

### `make stop`
This command stops the Docker containers defined in your docker-compose.yml file.

```
make stop
```

### `make remove`
This command stops and removes the Docker containers, networks, volumes, and images defined in your docker-compose.yml file.

```
make remove
```

### `make npm_install`
```
make npm_install
```
This command runs npm install inside the node service defined in your docker-compose.yml file.


### `make compileFront`

```
make compileFront
```

This command runs webpack to compile the frontend assets inside the node service defined in your docker-compose.yml file.

### `make watchFront`

```
make watchFront
```

This command runs webpack --watch to watch and compile the frontend assets inside the node service defined in your docker-compose.yml file.

### `make migrate_code_to_remote_server`

```
make migrate_code_to_remote_server
```

This command runs a script (./scripts/deploy.sh) to deploy the code to a remote server.


### `make sync_local_db`

```
make sync_local_db
```
This command runs a script (./scripts/sync-local-db-from-production.sh) to sync the local database from the production database.


### `make sync_remote_db`

```
make sync_remote_db
```
This command runs a script (./scripts/sync-production-db-from-local.sh) to sync the production database from the local database.

