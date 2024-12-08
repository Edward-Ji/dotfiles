FROM fedora:latest

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
RUN groupadd -g $gid $name
RUN useradd -u $uid -g $gid -G wheel -m -s /bin/zsh $name \
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

# Set neovim to minimal and install plugins
ENV NVIM_MINIMAL=1
RUN nvim --headless "+Lazy! install" +qa

# Set locale for tmux to render nerd fonts properly
ENV LANG=C.UTF-8

# Start with zsh
CMD ["zsh"]
