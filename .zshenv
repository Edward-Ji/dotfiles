# zsh history environment variables
export HISTFILE="${ZDOTDIR:-$HOME}/.zsh_history"
export HISTSIZE=10000
export HISTTIMEFORMAT='[%F %T] '
export SAVEHIST=10000

# change default command line editor to vim
export EDITOR=vim
export VISUAL=vim

# set default bat theme
export BAT_THEME="GitHub"
. "$HOME/.cargo/env"
