# Supress the lengthy message but indicate it's bash
export BASH_SILENCE_DEPRECATION_WARNING=1

# Pre-process prompt
export PROMPT_COMMAND=precmd

precmd() {
    # Get exit code
    local exit_code="$?"

    # Working directory truncated to last three
    local wd=$(echo ${PWD/${HOME}/'~'} | rev | cut -d / -f 1-3 | rev)

    # Font styles
    local reset='\[\e[0m\]'
    local bold='\[\e[1m\]'
    # Colors
    local red='\[\e[0;31m\]'
    local green='\[\e[0;32m\]'
    local gray='\[\e[0;37m\]'

    PS1="${bold}${wd}${reset} "

    if [[ ${exit_code} -ne 0 ]]
    then
        PS1+="${red}\$${reset} "
    else
        PS1+="${green}\$${reset} "
    fi
}

