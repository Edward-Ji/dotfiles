# This script contains code for setting up environment and package managers.
# Usually the managers themselves auto-generate this code but with hardcoded
# paths. Here, the hardcoded paths have been replaced. Checks have also been
# inserted to verify if respective commands are installed.

# pyenv is a version manager for python
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
if type pyenv &>/dev/null; then
    eval "$(pyenv init -)"
fi

# jenv is a version manager for java
[[ -s "$HOME/.jenv/bin/jenv" ]] && export PATH="$HOME/.jenv/bin:$PATH"
if type jenv &>/dev/null; then
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

# zoxide is a smarter cd command, inspired by z and autojump.
if type zoxide &> /dev/null; then
    eval "$(zoxide init zsh)"
fi
