################################################################################
# ZSH Execution Timer                                                          #
# This script utilizes the zsh pre-execute and pre-command functions to keep   #
# track of the execution time of interactive commands. The result will be      #
# printed out in seconds if it is greater than a set threshold.                #
#                                                                              #
# Environment variables                                                        #
# TIMER_MINIMUM -- only prints the elapsed time if it is greater than this     #
#   threshold, defaults to 3                                                   #
################################################################################

preexec_timer() {
    timer=${timer:-$SECONDS}
}

precmd_timer() {
    if [[ $timer ]]
    then
        local elapsed=$(( $SECONDS - $timer ))
        unset timer
        [[ $elapsed -gt $TIMER_MINIMUM ]] && printf "⌚︎%ds\n" $elapsed
    fi
}

[[ -z $TIMER_MINIMUM ]] && export TIMER_MINIMUM=3

preexec_functions+=(preexec_timer)
precmd_functions+=(precmd_timer)
