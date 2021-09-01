# >>> zsh customisations >>>
# prompt end of line mark
PROMPT_EOL_MARK='%F{7}«%f'
# prompt format
PROMPT='%B%3~%b %(?.%F{green}.%F{red})❯%f '

# automatically cd if command is the name of a directory
setopt AUTO_CD

# enable correction
setopt CORRECT
setopt CORRECT_ALL
# <<< zsh customisations <<<

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/admin/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/admin/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/admin/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/admin/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# >>> sdkman initialization >>>
export SDKMAN_DIR="/Users/admin/.sdkman"
[[ -s "/Users/admin/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/admin/.sdkman/bin/sdkman-init.sh"
# <<< sdkman initialization <<<

# >>> jenv initialization >>>
export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"
# <<< jenv initialization <<<

# The following lines were added by compinstall

zstyle ':completion:*' matcher-list 'm:{[:lower:]}={[:upper:]}'
zstyle :compinstall filename '/Users/admin/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

