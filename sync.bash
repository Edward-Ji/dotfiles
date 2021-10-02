usage="$(basename "$0") [-i]
    This script syncs specific files between the XDG config directory and this
    git repository. The XDG config directory if not set defaults to the home
    directory. The sync works by creating a hard links. The default mode is
    backup mode, which creates a hard link of files in the XDG config directory
    in the git repository. The option -i specifies install mode, which works in
    reverse."

# List of files/folders to backup
files=".vimrc .vim/after/ftplugin
    .hushlogin .zsh .zshenv .zshrc .zprofile
    .bash_profile"

# Handle options
while getopts i option
do
    case $option in
        i)
            mode='i'
            ;;
        ?)
            exit 1
    esac
done

# Config directory (defauls to home directory)
config_dir="${XDG_CONFIG_DIR:-$HOME}"

# Handle install mode
if [[ $mode = 'i' ]]
then
    link_from="."
    link_to="$config_dir"
    echo "Installing files $files to config dir $config_dir"
else
    link_from="$config_dir"
    link_to="."
    echo "Backing up files $files in config dir $config_dir"
fi

# Copy and add all file
for file in $files
do
    if [[ -d "$link_from/$file" ]]
    then
        mkdir -p "$link_to/$file"
        for rfile in $(ls -A $link_from/$file)
        do
            ln -fv "$link_from/$file/$rfile" "$link_to/$file"
        done
    elif [[ -f "$link_from/$file" ]]
    then
        mkdir -p "$link_to/$(dirname "$file")"
        ln -fv "$link_from/$file" "$link_to/$file"
    else
        echo "Unknown file type $file"
        break
    fi
done

