export GPG_TTY=$(tty)
if [[ -x /opt/homebrew/bin/brew ]] then
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi
