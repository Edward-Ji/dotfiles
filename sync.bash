usage="Usage: $(basename "$0") [-h] [-i]
    This script syncs specific files between the XDG config directory and this
    git repository. The XDG config directory if not set defaults to the home
    directory. The sync works by creating a hard links. The default mode is
    backup mode, which creates a hard link of files in the XDG config directory
    in the git repository.

Options:
    -h  prints this usage message
    -i  specifies install mode, which creates link in reverse to that of
        backup mode"

# Handle options
while getopts ':hi' option
do
    case $option in
        h)
            echo "$usage"
            exit
            ;;
        i)
            mode='i'
            ;;
        ?)
            echo "Illegal option: -$OPTARG" >&2
            echo "$usage" >&2
            exit 1
            ;;
    esac
done

# List of files/folders to backup
if [[ -f 'include' ]]
then
    echo "Using include file"
    files=$(cat 'include')
else
    files=".vimrc .vim/after/ftplugin
        .hushlogin .zsh .zshenv .zshrc .zprofile
        .bash_profile"
fi

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
    if [[ "$link_from/$file" -ef "$link_to/$file" ]]
    then
        echo "Already linked file: $file"
    elif [[ -d "$link_from/$file" ]]
    then
        mkdir -p "$link_to/$file"
        for rfile in $(ls -A $link_from/$file)
        do
            if [[ "$link_from/$file/$rfile" -ef "$link_to/$file/$rfile" ]]
            then
                echo "Already linked file: $file/$rfile"
            else
                ln -fv "$link_from/$file/$rfile" "$link_to/$file"
            fi
        done
    elif [[ -f "$link_from/$file" ]]
    then
        mkdir -p "$link_to/$(dirname "$file")"
        ln -fv "$link_from/$file" "$link_to/$file"
    else
        echo "Invalid file type: $file"
        break
    fi
done

