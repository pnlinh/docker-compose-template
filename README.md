# Docker for Laravel development

### How to install

- Install [Makefile](https://makefiletutorial.com/) on your OS (recommend)
- Prepare project struct below:
  ![project struct](https://user-images.githubusercontent.com/26193890/186565110-93532d9f-1ccf-4500-82fc-551e86171974.png)

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
