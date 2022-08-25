# Docker
## What is Docker?
**Docker** is a tool to run software in isolated environment - "container". 
It's like running your program in a virtual machine, 
but container consumes much less resources, than VM.

Learn more at [Docker.com](https://www.docker.com/what-docker) 
and [docs.docker.com](https://docs.docker.com/)

## What is Docker-Compose?
Docker command line utility allows to configure and operate one container at a time.
Corresponding Dockerfile format allows you to describe one container content and behaviour.
You can configure containers very flexibly to interact with each other, when you run them,
but it requires running docker command multiple times with lots of configuration parameters.
 
**docker-compose** allows you to describe the whole environment, 
consisting of multiple containers (each of containers definitions is described in its own file),
their dependencies and other rules, and run the whole environment with single command.
Also with docker-compose you can manage containers in that environment context by their name or role,
rather than by global names and identifiers.

# Installation & Configuration
## Docker
Follow official installation manual for Community Edition (CE):
https://docs.docker.com/engine/installation/

Ex. for Ubuntu (and it's derivatives, like Linux Mint) use this:
https://docs.docker.com/engine/installation/linux/docker-ce/ubuntu/

## Docker-Compose
On Ubuntu (or it's derivatives) simply run:
```bash
$ sudo curl -L "https://github.com/docker/compose/releases/download/1.16.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
$ sudo chmod +x /usr/local/bin/docker-compose

```
**Note:** *above command may contain reference to outdated version - you may check for later releases at GitHub [docker/compose](https://github.com/docker/compose/releases) repository.*

If this doesn't work or you have other OS, follow [official installation manual](https://docs.docker.com/compose/install/).

## After installation

1. **On Linux** make sure, you have **docker** user group on your system and you are a member of this group.
    This allows you to run docker commands without administrative permissions.
    You can do it, using your system GUI, or console commands:

    ```bash
    $ sudo groupadd docker
    $ sudo usermod -aG docker $(whoami)
    ```
    Logout current session, login.
2. Check, that *docker* and *docker-compose* are installed properly,
    reachable run from command line, do not produce error messages,
    Docker engine version >= 17.05, docker-composer version >= 1.12:
    ```bash
    $ docker --version
    $ docker-compose --version
    $ docker ps
    ```
3. *Optional, but highly recommended*: 
    [Enable Remote API on Docker hosts running systemd (like Ubuntu 15.04)](https://www.campalus.com/enable-remote-tcp-connections-to-docker-host-running-ubuntu-15-04/).
    
    This will allow PhpStorm to interact with Docker via IDEA 
    [Docker Integration](https://plugins.jetbrains.com/idea/plugin/7724-docker-integration)
    and [PHP Docker](https://plugins.jetbrains.com/idea/plugin/8595-php-docker) 
    plugins.
    
    Create a file called */etc/systemd/system/docker-tcp.socket* to make docker available on a TCP socket on port 2375:
    
    ```
    [Unit]
    Description=Docker Socket for the API  
    
    [Socket]
    ListenStream=2375  
    BindIPv6Only=both  
    Service=docker.service  
    
    [Install]
    WantedBy=sockets.target
    ```
    
    Then enable this new socket:
     
    ```bash
    $ systemctl enable docker-tcp.socket
    $ systemctl enable docker.socket
    $ systemctl stop docker
    $ systemctl start docker-tcp.socket
    $ systemctl start docker
    ```
    
    Test that it's working: 
    ```bash
    docker -H tcp://127.0.0.1:2375 ps
    ```
4. Configure Docker in PhpStorm according to [PhpStorm manual](https://confluence.jetbrains.com/display/PhpStorm/Docker+Support+in+PhpStorm).
    (Requires **3.** to be completed).
