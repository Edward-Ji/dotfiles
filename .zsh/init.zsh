# This script contains code for setting up environment and package managers.
# Usually the managers themselves auto-generate this code but with hardcoded
# paths. Here, the hardcoded paths have been replaced. Checks have also been
# inserted to verify if respective commands are installed.

# conda is a package manager for python
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

# jenv is a version manager for java
if type jenv &>/dev/null; then
    export PATH="$HOME/.jenv/bin:$PATH"
    eval "$(jenv init -)"
fi

# rbenv is a version manager for ruby
if type rbenv &>/dev/null; then
    eval "$(rbenv init - zsh)"
fi

# nvm is a version manager for node.js
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# mamba is a faster, drop-in replacement for conda
export MAMBA_EXE='/opt/homebrew/opt/micromamba/bin/micromamba';
export MAMBA_ROOT_PREFIX="$HOME/micromamba";
__mamba_setup="$("$MAMBA_EXE" shell hook --shell zsh --root-prefix "$MAMBA_ROOT_PREFIX" 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__mamba_setup"
elif [ -s "${MAMBA_EXE}" ]; then
    alias micromamba="$MAMBA_EXE"  # Fallback on help from mamba activate
fi
if type micromamba &>/dev/null
then
    alias mamba="micromamba"
fi
unset __mamba_setup

# zoxide is a smarter cd command, inspired by z and autojump.
if type zoxide &> /dev/null; then
    eval "$(zoxide init zsh)"
fi
