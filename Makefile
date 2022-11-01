SERVICE ?= 'app'

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "⚡ \033[34m%-30s\033[0m %s\n", $$1, $$2}'

all: build run

build: ## Build docker image
	docker-compose build --no-cache

install-composer: ## Composer install dependencies
	docker-compose exec --user www app sh -c "composer install"

start: run
run: ## Run application in Docker. Run 'make build' first
	docker-compose up -d

restart: ## Restart service containers
	docker-compose restart

stop: ## Force stop service containers
	docker-compose kill

down: destroy
destroy: ## Alias docker-compose down command
	docker-compose down

shell: ## Enter bash in running Docker container
	docker-compose exec --user www app sh

root: ## Enter bash in running Docker container as root user
	docker-compose exec --user root app sh

ps: status ## View services status
status:
	docker-compose ps

logs: ## Show service container logs
	docker-compose logs -f $(SERVICE)

redis-cli: ## Connect redis cli
	docker-compose exec redis redis-cli

mysql-cli: ## Connect mysql cli
	docker-compose exec mysql bash

psql-cli: ## Connect postgresql cli
	docker-compose exec pgsql bash

npm-install-force: ### Install node packages with force option
	docker-compose run --rm static-builder npm install --force

npm-dev: ### Bundle assets for development
	docker-compose run --rm static-builder npm run dev

npm-build: ### Bundle assets for production within Symfony
	docker-compose run --rm static-builder npm run build

npm-prod: ### Bundle assets for production within Laravel
	docker-compose run --rm static-builder npm run prod

npm-watch: ### Watcher assets for development
	docker-compose run --rm static-builder npm run watch
