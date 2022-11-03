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
      POSTGRES_DB=symfony-blog
      POSTGRES_USER=user
      POSTGRES_PASSWORD=secret

      DOCKER_APP_PORT=80
      DOCKER_POSTGRES_PORT=5432
      DOCKER_REDIS_PORT=7379
      DOCKER_MAIL_PORT=8026
      DOCKER_PREFIX_NAME=symfony
      PHP_VERSION=8.1
      ```
    - Laravel:
      ```
      DB_CONNECTION=mysql
      DB_HOST=mysql
      DB_PORT=3306
      DB_DATABASE=laravel
      DB_USERNAME=user
      DB_PASSWORD=secret

      MAIL_DRIVER=smtp
      MAIL_HOST=mail
      MAIL_PORT=1025
      MAIL_USERNAME=null
      MAIL_PASSWORD=null
      MAIL_ENCRYPTION=null
      
      DOCKER_APP_PORT=80
      DOCKER_MYSQL_PORT=3306
      DOCKER_REDIS_PORT=6379
      DOCKER_MAIL_PORT=8025
      DOCKER_PREFIX_NAME=laravel
      PHP_VERSION=8.1
      ```

- Build and up project

```
make build
make run
make install-composer
```

- To bundle assets

```
make npm-dev
make npm-watch
make npm-build #For Symfony
make npm-prod #For Laravel
```

- See more commands:

```shell
make help
```

```
⚡ build                          Build docker image
⚡ destroy                        Alias docker-compose down command
⚡ install-composer               Composer install dependencies
⚡ logs                           Show service container logs
⚡ mysql-cli                      Connect mysql cli
⚡ npm-build                      Bundle assets for production within Symfony
⚡ npm-dev                        Bundle assets for development
⚡ npm-install-force              Install node packages with force option
⚡ npm-prod                       Bundle assets for production within Laravel
⚡ npm-watch                      Watcher assets for development
⚡ ps                             View services status
⚡ psql-cli                       Connect postgresql cli
⚡ redis-cli                      Connect redis cli
⚡ restart                        Restart service containers
⚡ root                           Enter bash in running Docker container as root user
⚡ run                            Run application in Docker. Run 'make build' first
⚡ shell                          Enter bash in running Docker container
⚡ stop                           Force stop service containers
```

### References

- https://github.com/pnlinh/docker-php
