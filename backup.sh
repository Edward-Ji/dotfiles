################################################################################
# backup.sh                                                                    #
# This script backs up specified files in the xdg config directory.            #
################################################################################

# List of files/folders to backup
files=".vimrc .vim/after/ftplugin
    .hushlogin .zsh .zshenv .zshrc .zprofile
    .bash_profile"

# Config directory (defauls to home directory)
config_dir="${XDG_CONFIG_DIR:-$HOME}"
echo "Backing up files $files in config dir $config_dir"

# Copy and add all file
for file in $files
do
    if [[ -d "$config_dir/$file" ]]
    then
        mkdir -p "./$file" && ln -fv "$config_dir/$file/"* "./$file"
    elif [[ -f "$config_dir/$file" ]]
    then
        mkdir -p `dirname "$file"` && ln -fv "$config_dir/$file" "./$file"
    else
        echo "Ignored file $config_dir/$file"
        break
    fi
done

# Commit and push
git add -A
git commit -m "${1:-'Auto backup'}"
git push -u origin main
