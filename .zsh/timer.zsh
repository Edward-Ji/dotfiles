preexec_timer() {
    timer=${timer:-$SECONDS}
}

precmd_timer() {
    if [[ $timer ]]
    then
        local elapsed=$(( $SECONDS - $timer ))
        unset timer
        [[ $elapsed -ne 0 ]] && printf "⌚︎%ds\n" $elapsed
    fi
}

preexec_functions+=(preexec_timer)
precmd_functions+=(precmd_timer)
