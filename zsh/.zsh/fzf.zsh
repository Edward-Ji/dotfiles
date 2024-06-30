# fzf is a general-purpose command-line fuzzy finder.
if command -v fzf &> /dev/null; then
    FZF_ALT_C_COMMAND= source <(fzf --zsh)
elif [ -f ~/.fzf.zsh ]; then
    FZF_ALT_C_COMMAND= source ~/.fzf.zsh
fi

zle -N fzf-cd-widget
bindkey '^G' fzf-cd-widget
