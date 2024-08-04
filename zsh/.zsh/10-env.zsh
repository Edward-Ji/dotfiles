# pipx is a tool to install and run python applications in isolated environments.
export PATH="$HOME/.local/bin:$PATH"

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
