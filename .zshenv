# zsh history environment variables
export HISTFILE="${ZDOTDIR:-$HOME}/.zsh_history"
export HISTSIZE=10000
export HISTTIMEFORMAT='[%F %T] '
export SAVEHIST=10000

# change default command line editor to vim
export EDITOR=nvim
export VISUAL=nvim

# cargo generated
[[ -r "$HOME/.cargo/env" ]] && . "$HOME/.cargo/env"

# quarto generated
export PATH="/Users/eji/Applications/quarto/bin:$PATH"
