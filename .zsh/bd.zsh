bd() {
    # If at root directory do nothing
    if [[ $PWD = '/' ]]
    then
        return 0
    fi
    # If no argument is provided go up one level
    if [[ -z "$1" ]]
    then
        cd ..
        return 0
    fi

    # Prepare all parent directory names and count max level
    # Use forward slash as seperator
    local IFS=/
    # Read parents as a raw string into an array
    local parents
    read -rA parents <<< $PWD
    # Exclude current directory name
    parents=(${(Oa)parents:0:-1} '/')
    # Count the level of directories
    level=${#parents}

    local dest="./"

    # If argument provided is an integer, got up that many levels
    if [[ "$1" = <-> ]]
    then
        if [[ $1 -eq 0 ]]
        then
            return 0
        elif [[ $1 -gt $level ]]
        then
            print -- "$0: Error: Can not go up $1 times"
            return 1
        fi
        for i in {1..$1}
        do
            dest+="../"
        done
        cd $dest
        return 0
    fi

    # If argument is a parent directory name, do up to the directory
    local parent
    foreach parent (${parents})
    do
        dest+="../"
        if [[ $1 == $parent ]]
        then
            cd $dest
            return 0
        fi
    done

    # All above methods fail signals invalid argument
    print -- "$0: Error: No parent directory named '$1'"
    return 2
}

# Get autocomplete options
function _bd {
    # Use forward slash as seperator
    local IFS=/
    # Read parents as a raw string into an array
    local parents
    read -rA parents <<< $PWD
    # Exclude current directory name
    parents=(${(Oa)parents:0:-1} '/')
    # Set auto-complete reply to the max level and all parent names
    reply=($parents)
}

compctl -V names -K _bd bd
