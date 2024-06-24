# change default command line editor to vim
export EDITOR=nvim
export VISUAL=nvim

# cargo generated
[[ -r "$HOME/.cargo/env" ]] && . "$HOME/.cargo/env"

# quarto generated
export PATH="$HOME/Applications/quarto/bin:$PATH"

# do not show any hints about changing brew behaviour with environment variables
export HOMEBREW_NO_ENV_HINTS=1
