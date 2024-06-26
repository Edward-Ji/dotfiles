# Aliases
alias ls='ls --color'
alias la='ls -a'
alias ll='ls -hl'
alias lla='ls -hla'
alias mkdir='mkdir -pv'
alias grep='grep --color'

# Prompt
export PROMPT_COMMAND=precmd
precmd() {
    # Get exit code
    local -i exit_code=$?

    # Working directory truncated to last three
    local wd
    wd=$(echo "${PWD/${HOME}/'~'}" | rev | cut -d / -f 1-3 | rev)

    # Font styles
    local reset='\e[0m'
    local bold='\e[1m'
    # Colors
    local red='\e[0;31m'
    local green='\e[0;32m'

    PS1="\[${bold}\]${wd}\[${reset}\] "

    if [[ ${exit_code} -ne 0 ]]
    then
        PS1+="\[${red}\]\$\[${reset}\] "
    else
        PS1+="\[${green}\]\$\[${reset}\] "
    fi
}

# History
shopt -s histappend
HISTSIZE=-1
HISTFILESIZE=-1
HISTCONTROL=ignoreboth
