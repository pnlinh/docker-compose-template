PWD = $(shell pwd)

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "⚡ \033[34m%-30s\033[0m %s\n", $$1, $$2}'

all: build run install

build: ## Build Docker image
	docker-compose build --no-cache

install: ## Install dependencies libs
	docker-compose exec --user www app sh -c "composer install"

start: run
run: ## Run application in Docker. Run 'make build' first
	docker-compose up -d

restart: ## Restart containers
	docker-compose restart

stop: ## Stop application running in Docker
	docker-compose kill

down: destroy
destroy: ## Alias docker-compose down command
	docker-compose down

shell: ## Enter bash in running Docker container
	docker-compose exec --user www app sh

root: ## Enter bash in running Docker container as root user
	docker-compose exec --user root app sh

ip: ## Get IP address of docker container
	docker inspect laravel-app | grep "IPAddress\": \"1.*" | sed 's/IPAddress/App IPAddress/g'
	docker inspect laravel-mysql | grep "IPAddress\": \"1.*" | sed 's/IPAddress/DB IPAddress/g'
	docker inspect laravel-redis | grep "IPAddress\": \"1.*" | sed 's/IPAddress/Redis IPAddress/g'
	docker inspect laravel-mailhog | grep "IPAddress\": \"1.*" | sed 's/IPAddress/Mail IPAddress/g'

ps: status ## View services status
status:
	docker-compose ps

logs: ## Show 'app' container logs
	docker-compose logs -f app

redis-cli: ## Connect redis cli
	docker-compose exec redis redis-cli

mysql-cli: ## Connect mysql cli
	docker-compose exec mysql bash

static: ### Bundle assets for development mode
	docker run -it --rm -v "${PWD}:/build" pnlinh/static-builder npm run dev

watch: ### Watcher assets for development mode
	docker run -it --rm -v "${PWD}:/build" pnlinh/static-builder npm run watch
