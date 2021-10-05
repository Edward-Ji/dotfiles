# Suppress the lengthy deprecation message
export BASH_SILENCE_DEPRECATION_WARNING=1

# Pre-process prompt
export PROMPT_COMMAND=precmd

precmd() {
    # Get exit code
    local -i exit_code=$?

    # Working directory truncated to last three
    local wd=$(echo ${PWD/${HOME}/'~'} | rev | cut -d / -f 1-3 | rev)

    # Font styles
    local reset='\e[0m'
    local bold='\e[1m'
    # Colors
    local red='\e[0;31m'
    local green='\e[0;32m'
    local gray='\e[0;37m'
    # Cursor
    local savecursor='\e7'
    local restorecursor='\e8'

    PS1="\[${bold}\]${wd}\[${reset}\] "

    if [[ ${exit_code} -ne 0 ]]
    then
        PS1+="\[${red}\]\$\[${reset}\] "
    else
        PS1+="\[${green}\]\$\[${reset}\] "
    fi

    rprompt="${USER}@${HOSTNAME:-$(hostname)}"
    local offsetcursor="\e[$((${COLUMNS} - ${#rprompt}))G"
    PS1="\[${savecursor}${offsetcursor}${gray}${rprompt}${reset}${restorecursor}${PS1}\]"
}

