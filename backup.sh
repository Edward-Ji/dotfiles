################################################################################
# backup.sh                                                                    #
# This script backs up specified files in the xdg config directory.            #
################################################################################

# List of files/folders to backup
files=".hushlogin .vimrc .vim/after/ftplugin .zsh .zshenv .zshrc"

# Config directory (defauls to home directory)
config_dir="${XDG_CONFIG_DIR:-$HOME}"
echo "Config directory: $config_dir"

# Copy and add all file
for file in $files
do
    if [[ -d "$config_dir/$file" ]]
    then
        echo "Copying directory $config_dir/$file and its contents"
        mkdir -p "./$file" && cp -R "$config_dir/$file/" "./$file"
    elif [[ -f "$config_dir/$file" ]]
    then
        echo "Copying file $config_dir/$file"
        mkdir -p `dirname "$file"` && cp "$config_dir/$file" "./$file"
    else
        echo "Missing file $config_dir/$file"
        break
    fi
    git add "$file"
done

# Add this script
echo "Adding backup script"
git add backup.sh

# Commit and push
git commit -m "${1:-Auto backup}"
git push -u origin main
