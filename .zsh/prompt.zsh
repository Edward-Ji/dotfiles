# prompt end of line mark
PROMPT_EOL_MARK='%F{7}\%f'

# === prompt ===
setopt PROMPT_SUBST

# working directory
PROMPT='%B%3~%b '

# git integration
zstyle ':vcs_info:git*' formats '%b'
zstyle ':vcs_info:git*' actionformats '%b (%a)'
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
PROMPT+='${vcs_info_msg_0_:+"ᚠ $vcs_info_msg_0_ "}'

# exit code and superuser integration
PROMPT+='%(?.%F{green}.%F{red})❯%(!.❯.)%f '

# right hand side prompt show hostname
RPROMPT='%F{7}%m%f'
