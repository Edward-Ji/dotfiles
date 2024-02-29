FROM alpine:latest

# Install packages
RUN apk add bash gcc git musl-dev neovim shadow tmux zsh zsh-vcs --update

# Create user
RUN addgroup -S tour && adduser -D -S tourist -G tour
RUN chsh -s /bin/zsh tourist

# Sync dotfiles
USER tourist
WORKDIR /home/tourist
COPY --chown=tourist:tour . dotfiles
RUN yes | dotfiles/dotsync -i && rm -r dotfiles

# Install neovim plugins
ENV NVIM_MINIMAL 1
RUN nvim --headless "+Lazy! sync" +qa

# Set locale for tmux to render nerd fonts properly
ENV LANG en.UTF-8
ENV LC_ALL en.UTF-8

CMD /bin/zsh
