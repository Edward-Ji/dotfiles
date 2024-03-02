FROM ubuntu:latest

# Install packages
RUN apt-get update \
&&  apt-get install -y \
    git \
    sudo \
    tmux \
    zsh \
# Build dependencies for neovim
    ninja-build \
    gettext \
    cmake \
    unzip \
    curl

# Create a user with sudo privileges and set zsh as default shell
RUN useradd --groups sudo --create-home --shell /bin/zsh admin \
&&  echo "%sudo ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
USER admin
WORKDIR /home/admin

# Sync dotfiles
COPY --chown=admin . dotfiles
RUN yes | dotfiles/dotsync -i \
&&  rm -r dotfiles

# Install miniconda
RUN mkdir -p ~/miniconda3 \
&&  curl https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-`arch`.sh \
    --output ~/miniconda3/miniconda.sh \
&&  bash ~/miniconda3/miniconda.sh -b -u -p ~/miniconda3 \
&&  rm -rf ~/miniconda3/miniconda.sh

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

# Set neovim to minimal and install plugins
ENV NVIM_MINIMAL 1
RUN nvim --headless "+Lazy! sync" +qa

# Set locale for tmux to render nerd fonts properly
ENV LANG C.UTF-8

# Start with zsh
CMD ["zsh"]
