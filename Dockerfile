FROM ubuntu:latest

# Install packages
RUN apt-get update \
&&  apt-get install -y \
    git \
    stow \
    sudo \
    tmux \
    zsh \
# Build dependencies for neovim
    ninja-build \
    gettext \
    cmake \
    unzip \
    curl \
# Build dependencies for python
    zlib1g-dev libssl-dev libbz2-dev libncurses-dev libffi-dev \
    libreadline-dev libsqlite3-dev liblzma-dev \
# Application dependencies
    fzf \
    ripgrep

# Create a user with sudo privileges and set zsh as default shell
RUN useradd --groups sudo --create-home --shell /bin/zsh admin \
&&  echo "%sudo ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
USER admin
WORKDIR /home/admin

# Install pyenv
RUN git clone https://github.com/pyenv/pyenv.git ~/.pyenv \
&&  sudo ln -s ~/.pyenv/bin/pyenv /usr/local/bin

# Install zoxide - a smarter cd command
RUN curl -sS https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh \
    | bash

# Install node.js using node version manager
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh \
    | bash

# Build neovim from source
RUN git clone --depth 1 --branch stable https://github.com/neovim/neovim/ \
&&  cd neovim \
&&  make CMAKE_BUILD_TYPE=Release \
&&  sudo make install \
&&  cd .. \
&&  rm -r neovim

# Sync dotfiles
COPY --chown=admin . dotfiles
RUN cd dotfiles \
&&  stow --adopt */ \
&&  git restore */

# Set neovim to minimal and install plugins
ENV NVIM_MINIMAL 1
RUN nvim --headless "+Lazy! sync" +qa

# Set locale for tmux to render nerd fonts properly
ENV LANG C.UTF-8

# Start with zsh
CMD ["zsh"]
