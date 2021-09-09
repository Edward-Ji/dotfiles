################################################################################
# backup.sh                                                                    #
# This script backs up specified files in the xdg config directory.            #
################################################################################

# List of files/folders to backup
files=".hushlogin .vimrc .vim/after/ftplugin .zsh .zshenv .zshrc"

# Config directory (defauls to home directory)
config_dir="${XDG_CONFIG_DIR:-$HOME}"

# Copy and add all file
for file in $files
do
    if [[ -d "$config_dir/$file" ]]
    then
        mkdir -p "./$file" && ln "$config_dir/$file/*" "./$file"
    elif [[ -f "$config_dir/$file" ]]
    then
        mkdir -p `dirname "$file"` && ln "$config_dir/$file" "./$file"
    else
        echo "Missing file $config_dir/$file"
        break
    fi
    git add "$file"
done

# Commit and push
git add -A
git commit -m "${1:-Auto backup}"
git push -u origin main
