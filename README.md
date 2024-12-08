# Dotfiles

My user-specific application configuration.

## Try with Docker

[![Docker Image Version](https://img.shields.io/docker/v/edwardji/dotfiles?style=flat-square&logo=docker)][dockerhub]
[![amd64 Docker Image Size](https://img.shields.io/docker/image-size/edwardji/dotfiles?arch=amd64&style=flat-square&logo=amd)][dockerhub]
[![arm64 Docker Image Size](https://img.shields.io/docker/image-size/edwardji/dotfiles?arch=arm64&style=flat-square&logo=arm)][dockerhub]

To quickly test the configurations in a Docker environment, you can run the
following command. This will pull the latest Docker image, start an interactive
terminal session that will be removed when you exit.

```
docker run --rm -it edwardji/dotfiles:latest
```

[dockerhub]: https://hub.docker.com/r/edwardji/dotfiles

## Installation

### Stow

To install all configurations at once, use the following command. This will
create symlinks for all dotfiles in your home directory.

```
stow */
```

> [!WARNING]
>
> The command above will overwrite your existing configurations. Make sure you
> have backups of any important files before proceeding.

If you encounter conflicts with existing configurations, you can use the
following command to adopt the new configurations by replacing the current
ones:

```
stow --adopt */ && git restore */
```

### Docker

To create an isolated and portable development environment using Docker, run the
following command. This builds a Docker image with your user information,
ensuring that file ownerships are correctly set.

```
docker build \
    --build-arg name=$(whoami) \
    --build-arg uid=$(id -u) \
    --build-arg gid=$(id -g) \
    -t dotfiles \
    .
```

Once the image is built, you can start a container and mount your current
working directory. This allows you to interact with files on your host system
seamlessly.

```
docker run -it -e TERM=$TERM -v $(pwd):$(pwd) -w $(pwd) dotfiles
```