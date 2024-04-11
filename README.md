# Dotfiles

My user-specific application configuration.

## Installation

### Stow

You can run the following command to install everything:

```
stow */
```

If there's any conflict, run the following command instead:

```
stow --adopt */ && git restore */
```

> [!WARNING]
>
> The above command will overwrite your existing configurations.

### Try with Docker

[![Docker Image Version](https://img.shields.io/docker/v/edwardji/dotfiles?style=flat-square&logo=docker)][dockerhub]
[![amd64 Docker Image Size](https://img.shields.io/docker/image-size/edwardji/dotfiles?arch=amd64&style=flat-square&logo=amd)][dockerhub]
[![arm64 Docker Image Size](https://img.shields.io/docker/image-size/edwardji/dotfiles?arch=arm64&style=flat-square&logo=arm)][dockerhub]

> [!NOTE]
> Please be aware that not all features will work in the Docker container.

You can run the following command to try with Docker:

```
docker run --rm -it edwardji/dotfiles:latest
```

[dockerhub]: https://hub.docker.com/r/edwardji/dotfiles
