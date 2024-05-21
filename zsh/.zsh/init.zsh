# This script contains code for setting up environment and package managers.
# Usually the managers themselves auto-generate this code but with hardcoded
# paths. Here, the hardcoded paths have been replaced. Checks have also been
# inserted to verify if respective commands are installed.

# homebrew is a package manager for macOS
if [ "$(arch)" = "arm64" ]; then
    BREW_PATH="/opt/homebrew/bin/brew"
elif [ "$(arch)" = "x86_64" ]; then
    BREW_PATH="/usr/local/bin/brew"
fi
if [[ -f $BREW_PATH && -x $BREW_PATH ]]; then
    eval "$($BREW_PATH shellenv)"
fi

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

# zoxide is a smarter cd command, inspired by z and autojump.
if type zoxide &> /dev/null; then
    eval "$(zoxide init zsh)"
fi

# fzf is a general-purpose command-line fuzzy finder.
command -v fzf &> /dev/null && eval "$(fzf --zsh)"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
