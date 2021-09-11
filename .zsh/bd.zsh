function bd {
    # If no argument is provided go up one level
    if [[ -z "$1" ]]
    then
        cd ..
        return 0
    fi

    # Prepare all parent directory names and count max level
    local level_max=${#${(ps:/:)${PWD}}}
    local i
    local parents
    for i in {$level_max..2}
    do
        parents=($parents "$(echo $PWD | cut -d / -f $i)")
    done
    parents=($parents "/")

    local dest="./"

    # If argument provided is an integer, got up that many levels
    dest="./"
    if [[ "$1" = <-> ]]
    then
        if [[ $1 -gt $level_max ]]
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
function _bd_comp {
    # Use forward slash as seperator
    local IFS=/
    # Read parents as a raw string into an array
    local parents
    read -rA parents <<< $PWD
    # Exclude current directory name
    parents=('/' ${parents:0:-1})
    # Set auto-complete reply to the max level and all parent names
    reply=(${(Oa)parents})
}

compctl -V directories -K _bd_comp bd
