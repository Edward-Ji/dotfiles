# Dotfiles

My user-specific application configuration.

## Try with Docker

[![Docker Image Version](https://img.shields.io/docker/v/edwardji/dotfiles?style=flat-square&logo=docker)][dockerhub]
[![amd64 Docker Image Size](https://img.shields.io/docker/image-size/edwardji/dotfiles?arch=amd64&style=flat-square&logo=amd)][dockerhub]
[![arm64 Docker Image Size](https://img.shields.io/docker/image-size/edwardji/dotfiles?arch=arm64&style=flat-square&logo=arm)][dockerhub]

You can run the following command to try with Docker:

```
docker run --rm -it edwardji/dotfiles:latest
```

[dockerhub]: https://hub.docker.com/r/edwardji/dotfiles

## Installation

### Stow

You can run the following command to install everything:

```
stow */
```

> [!WARNING]
>
> The command below will overwrite your existing configurations.

If there's any conflict, run the following command instead:

```
stow --adopt */ && git restore */
```

### Docker

You can run the following command to build an isolated and portable development
environment:

```
docker build \
    --build-arg name=$(whoami) \
    --build-arg uid=$(id -u) \
    --build-arg gid=$(id -g) \
    -t dotfiles \
    .
```

Start a container and mount your working directory, allowing you to interact
with host files seamlessly.

```
docker run -it -e TERM=$TERM -v $(pwd):$(pwd) -w $(pwd) dotfiles
```
