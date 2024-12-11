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
RUN useradd --groups wheel --create-home --shell /bin/zsh admin \
&&  echo "%wheel ALL = (ALL) NOPASSWD: ALL" >> /etc/sudoers
USER admin
WORKDIR /home/admin

# Install pyenv
RUN curl https://pyenv.run | bash

# Sync dotfiles
COPY --chown=admin . dotfiles
RUN cd dotfiles \
&&  stow --adopt */ \
&&  git restore */

# Set neovim to minimal and install plugins
ENV NVIM_MINIMAL=1
RUN nvim --headless "+Lazy! install" +qa

# Set locale for tmux to render nerd fonts properly
ENV LANG=C.UTF-8

# Start with zsh
CMD ["zsh"]
