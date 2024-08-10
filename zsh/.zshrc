for zsh_file in ~/.zsh/*.zsh; do
    source $zsh_file
done

fpath=(~/.zfunc $fpath)
