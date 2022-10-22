# Docker for Laravel development

### How to use

- Install [Makefile](https://makefiletutorial.com/) on your OS
- Project struct:
  ```
  ├── app
  ├── bootstrap
  ├── config
  ├── database
  ├── docker
  │    └── docker-composer.base.yml
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
```

Try url http://localhost

- View all makefile commands:

```shell
make help
```

```shell
⚡ build                          Build Docker image for local development
⚡ destroy                        Alias docker-compose down command
⚡ ip                             Get IP address of docker container
⚡ logs                           Show 'app' container logs
⚡ ps                             View services status
⚡ restart                        Restart containers
⚡ root                           Enter bash in running Docker container as root user
⚡ run                            Run application in Docker. Run 'make build' first
⚡ shell                          Enter bash in running Docker container
⚡ static                         Bundle assets for development mode
⚡ stop                           Stop application running in Docker
⚡ watch                          Watcher assets for development mode
```

### References
- https://github.com/pnlinh/docker-php
