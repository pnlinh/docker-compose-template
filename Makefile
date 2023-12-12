SERVICE ?= 'app'
DOCKER_COMPOSE=$(if $(shell which docker compose),docker compose,docker-compose)

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "⚡ \033[34m%-30s\033[0m %s\n", $$1, $$2}'

all: build run

build: ## Build docker image
	$(DOCKER_COMPOSE) build --no-cache

composer-install: ## Composer install dependencies
	$(DOCKER_COMPOSE) exec --user www app sh -c "composer install"

start: run
run: ## Run application in Docker. Run 'make build' first
	$(DOCKER_COMPOSE) up -d

restart: ## Restart service containers
	$(DOCKER_COMPOSE) restart

stop: ## Force stop service containers
	$(DOCKER_COMPOSE) kill

down: destroy
destroy: ## Alias docker-compose down command
	$(DOCKER_COMPOSE) down

shell: ## Enter bash in running Docker container
	$(DOCKER_COMPOSE) exec --user www app sh

root: ## Enter bash in running Docker container as root user
	$(DOCKER_COMPOSE) exec --user root app sh

ps: status ## View services status
status:
	$(DOCKER_COMPOSE) ps

logs: ## Show service container logs
	$(DOCKER_COMPOSE) logs -f $(SERVICE)

redis-cli: ## Connect redis cli
	$(DOCKER_COMPOSE) exec redis redis-cli

mysql-cli: ## Connect mysql cli
	$(DOCKER_COMPOSE) exec mysql bash

psql-cli: ## Connect postgresql cli
	$(DOCKER_COMPOSE) exec pgsql bash

npm-install-force: ### Install node packages with force option
	$(DOCKER_COMPOSE) run --rm static-builder npm install --force

npm-dev: ### Bundle assets for development
	$(DOCKER_COMPOSE) run --rm static-builder npm run dev

npm-build: ### Bundle assets for production within Symfony
	$(DOCKER_COMPOSE) run --rm static-builder npm run build

npm-prod: ### Bundle assets for production within Laravel
	$(DOCKER_COMPOSE) run --rm static-builder npm run prod

npm-watch: ### Watcher assets for development
	$(DOCKER_COMPOSE) run --rm static-builder npm run watch
