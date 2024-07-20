This README will guide you through the setup and usage of the project.

## Table of Contents

- [Prerequisites](#prerequisites)
- [Makefile Targets](#makefile-targets)
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

### `make build`
Build the Docker images for the project.

```sh
make build

