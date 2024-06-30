# Source zsh scripts
for zsh_file in ~/.zsh/*.zsh; do
    source $zsh_file
done

# Define functions for autoloading
fpath=(~/.zfunc $fpath)

# homebrew auto-complete
if type brew &>/dev/null; then
    FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"
fi

bindkey -v

zstyle ':completion:*' completer _complete _ignored _approximate
zstyle ':completion:*' matcher-list 'm:{[:lower:]}={[:upper:]} r:|[._-/]=** r:|=**' 'm:{[:lower:]}={[:upper:]}'
zstyle :compinstall filename "${HOME}/.zshrc"

autoload -Uz compinit
compinit
