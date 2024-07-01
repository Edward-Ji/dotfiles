# fzf is a general-purpose command-line fuzzy finder.
if command -v fzf &> /dev/null; then
    source <(fzf --zsh)
elif [ -f ~/.fzf.zsh ]; then
    source ~/.fzf.zsh
else
    return
fi

zle -N fzf-cd-widget
bindkey '^G' fzf-cd-widget
