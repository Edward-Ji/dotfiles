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

> [!NOTE]
> On Linux, Docker does not map UID/GID for host volumes. The `TARGET_UID` and
> `TARGET_GID` variables set the container’s user and group to match your host
> system, ensuring proper file permissions when working with mounted host
> volumes.

To seamlessly integrate the dotfiles container with your environment, use the
following command. This matches the container’s user and group with the host’s,
sets the terminal type for proper functionality, and binds the current directory
as the working directory inside the container.

```
docker run -it \
    --env TARGET_UID=$(id -u) \
    --env TARGET_GID=$(id -g) \
    --env TERM=$TERM \
    --volume $(pwd):$(pwd) \
    --workdir $(pwd) \
    edwardji/dotfiles:latest
```
