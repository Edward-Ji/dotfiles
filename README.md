# Dotfiles

This repository contains a backup of all my personal configurations, as well as
an installation script.

## Installation

### Dotsync

> [!CAUTION]
> The ./dotsync script will overwrite your existing configurations. If you wish
> to preserve them, you need to back them up manually.

To install the repository's dotfiles to your machine, use the following command:
```
./dotsync -i
```

For more information on the script and available options, use this command:
```
./dotsync -h
```

### Try with Docker

[![Docker Image Version](https://img.shields.io/docker/v/edwardji/dotfiles?style=flat-square&logo=docker)][dockerhub]
[![amd64 Docker Image Size](https://img.shields.io/docker/image-size/edwardji/dotfiles?arch=amd64&style=flat-square&logo=amd)][dockerhub]
[![arm64 Docker Image Size](https://img.shields.io/docker/image-size/edwardji/dotfiles?arch=arm64&style=flat-square&logo=arm)][dockerhub]

> [!NOTE]
> Please be aware that not all features will work in the Docker container.

You can run the following command to try with Docker:
```
docker run --pull=always --rm -it edwardji/dotfiles:latest
```

[dockerhub]: https://hub.docker.com/r/edwardji/dotfiles
