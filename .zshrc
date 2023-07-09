####################
# Load ZSH Plugins #
####################
for zsh_file in $HOME/.zsh/*.zsh
do
    source $zsh_file
done

plug_manager "esc/conda-zsh-completion" "agkozak/zsh-z"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$("$HOME/miniconda3/bin/conda" 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "$HOME/miniconda3/etc/profile.d/conda.sh" ]; then
        . "$HOME/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="$HOME/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# >>> jenv initialization >>>
if type jenv &>/dev/null
then
    export PATH="$HOME/.jenv/bin:$PATH"
    eval "$(jenv init -)"
fi
# <<< jenv initialization <<<

# homebrew auto-complete
if type brew &>/dev/null
then
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"
fi

# The following lines were added by compinstall

zstyle ':completion:*' completer _complete _ignored _approximate
zstyle ':completion:*' matcher-list 'm:{[:lower:]}={[:upper:]} r:|[._-/]=** r:|=**' 'm:{[:lower:]}={[:upper:]}'
zstyle :compinstall filename '/Users/admin/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

true
