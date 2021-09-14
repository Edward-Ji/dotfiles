# prompt end of line mark
PROMPT_EOL_MARK='%F{7}\%f'
# === prompt ===
setopt PROMPT_SUBST

# working directory
PROMPT='%B%3~%b '

# git integration
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
PROMPT+='${vcs_info_msg_0_:+"⑂ $vcs_info_msg_0_ "}'
zstyle ':vcs_info:git:*' formats '%b'

# exit code and superuser integration
PROMPT+='%(?.%F{green}.%F{red})❯%(!.❯.)%f '

