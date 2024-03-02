####################
# Load ZSH Plugins #
####################
for zsh_file in $HOME/.zsh/*.zsh
do
    source $zsh_file
done

# Define functions for autoloading
fpath=('~/.zfunc' $fpath)

# homebrew auto-complete
if type brew &>/dev/null; then
    FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"
fi

# The following lines were added by compinstall

zstyle ':completion:*' completer _complete _ignored _approximate
zstyle ':completion:*' matcher-list 'm:{[:lower:]}={[:upper:]} r:|[._-/]=** r:|=**' 'm:{[:lower:]}={[:upper:]}'
zstyle :compinstall filename '/Users/admin/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

bindkey -v
bindkey '^R' history-incremental-search-backward 
bindkey '^S' history-incremental-search-forward

# Enable interactive comments
setopt INTERACTIVE_COMMENTS
