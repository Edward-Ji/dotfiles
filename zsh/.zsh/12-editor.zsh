bindkey -v
export KEYTIMEOUT=1

bindkey -v '^?' backward-delete-char
bindkey '^[[Z' reverse-menu-complete

zstyle ':completion:*' completer _complete _ignored _approximate
zstyle ':completion:*' matcher-list 'm:{[:lower:]}={[:upper:]} r:|[._-/]=** r:|=**' 'm:{[:lower:]}={[:upper:]}'
zstyle :compinstall filename "${HOME}/.zshrc"

autoload -Uz compinit
compinit
