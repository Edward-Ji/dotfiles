FROM fedora:latest

# Install documentation for packages
RUN sed -i '/^tsflags=nodocs/d' /etc/dnf/dnf.conf \
&&  dnf reinstall -y '*' \
&&  dnf install -y man man-pages

# Install packages
RUN dnf install -y \
    git \
    stow \
    zsh \
    tmux \
    fzf \
    neovim \
    zoxide \
    nodejs \
    ripgrep \
    fd-find \
# Suggested build environment for pyenv
# https://github.com/pyenv/pyenv/wiki#suggested-build-environment
    make gcc patch zlib-devel bzip2 bzip2-devel readline-devel sqlite \
    sqlite-devel openssl-devel tk-devel libffi-devel xz-devel libuuid-devel \
    gdbm-libs libnsl2 \
&&  dnf clean all

# Create a user with administrative privileges and zsh as default shell
ARG name=admin
ARG uid=1000
ARG gid=1000
RUN groupadd --gid $gid --non-unique $name \
&&  useradd --uid $uid --gid $gid --non-unique \
    --create-home --shell /bin/zsh \
    --groups wheel $name \
&&  echo "%wheel ALL = (ALL) NOPASSWD: ALL" >> /etc/sudoers
USER $name
WORKDIR /home/$name

# Install pyenv
RUN curl https://pyenv.run | bash

# Sync dotfiles
COPY --chown=$name . dotfiles
RUN cd dotfiles \
&&  stow --adopt */ \
&&  git restore */

# Install neovim plugins that don't require user credentials
RUN echo "export NO_ASKPASS=1" >> ~/.config/zsh/zshrc.d/90-user.zsh
RUN nvim --headless "+Lazy! install" +qa

# Set locale for tmux to render nerd fonts properly
ENV LANG=C.UTF-8

# Start with zsh
CMD ["zsh"]
