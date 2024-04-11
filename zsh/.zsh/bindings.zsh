bindkey -v
bindkey '^R' history-incremental-search-backward 
bindkey '^S' history-incremental-search-forward

clear-terminal() { tput reset; zle redisplay; }
zle -N clear-terminal
bindkey '^L' clear-terminal
