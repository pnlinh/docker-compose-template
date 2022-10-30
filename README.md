# Docker compose template for PHP development

### How to use

- Install [Makefile](https://makefiletutorial.com/) on your OS
- Project struct with Laravel:
  ```
  ├── app
  ├── bootstrap
  ├── config
  ├── database
  ├── docker
  │    └── docker-compose.base.yml
       └── ...        
  ├── public
  ├── ...
  └── docker-compose.yml
  └── Makefile
  └── composer.json
  └── composer.lock
  ```

- Build and up project

```
cp .env.docker .env
make all
make install-composer
```

Try url http://localhost

- View all makefile commands:

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
