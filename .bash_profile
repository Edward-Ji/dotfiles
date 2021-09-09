# Supress the message that zsh is now default shell
export BASH_SILENCE_DEPRECATION_WARNING=1

# fonts
bold=$(tput bold)
normal=$(tput sgr0)

export PROMPT_COMMAND=precmd
function precmd {
    local wd=`pwd | rev | cut -d / -f 1,2,3 | rev`
    export PS1="${bold}${wd/${HOME}/~}${normal} $ "
}

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/admin/.sdkman"
[[ -s "/Users/admin/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/admin/.sdkman/bin/sdkman-init.sh"

