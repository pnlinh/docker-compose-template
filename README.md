# Docker compose template for PHP development

### How to use

- Install [Makefile](https://makefiletutorial.com/) on your OS
- Project struct:
  ```
  ├── app
  ├── bootstrap
  ├── config
  ├── database
  ├── docker
  │    └── node.Dockerfile
       └── ... 
  ├── public
  ├── ...
  └── docker-compose.yml
  └── Makefile
  └── composer.json
  └── composer.lock
  ```
  *Laravel project struct*

  ```
  ├── assets
  ├── bin
  ├── config
  ├── docker
  │    └── node.Dockerfile
       └── ... 
  ├── migrations
  ├── public
  ├── src
  ├── ...
  └── docker-compose.yml
  └── Makefile
  └── composer.json
  └── composer.lock
  ```

  *Symfony project struct*


- Prepare environment config (`.env` file):
    - Symfony:
      ```
      DB_PORT=5432
      DB_DATABASE=symfony-blog
      DB_USERNAME=user
      DB_PASSWORD=secret

      DOCKER_APP_PORT=80
      DOCKER_DB_PORT=4306
      DOCKER_REDIS_PORT=7379
      DOCKER_MAIL_PORT=8026
      DOCKER_PREFIX_NAME=symfony
      ```
    - Laravel:
      ```
      DB_CONNECTION=mysql
      DB_HOST=mysql
      DB_PORT=3306
      DB_DATABASE=laravel
      DB_USERNAME=user
      DB_PASSWORD=secret

      DOCKER_APP_PORT=80
      DOCKER_DB_PORT=3306
      DOCKER_REDIS_PORT=6379
      DOCKER_MAIL_PORT=8025
      DOCKER_PREFIX_NAME=laravel
      ```

- Build and up project

```

make build
make run
make install-composer
```

- See more commands:

```shell
make help
```

```shell
⚡ build                          Build docker image for local development
⚡ destroy                        Alias docker-compose down command
⚡ install-composer               Composer install dependencies
⚡ logs                           Show service container logs
⚡ mysql-cli                      Connect mysql cli
⚡ npm-build                      Bundle assets for production
⚡ npm-dev                        Bundle assets for development
⚡ npm-watch                      Watcher assets for development
⚡ ps                             View services status
⚡ redis-cli                      Connect redis cli
⚡ restart                        Restart service containers
⚡ root                           Enter bash in running Docker container as root user
⚡ run                            Run application in Docker. Run 'make build' first
⚡ shell                          Enter bash in running Docker container
⚡ stop                           Force stop service containers
```

### References

- https://github.com/pnlinh/docker-php
