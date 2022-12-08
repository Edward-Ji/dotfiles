#!/usr/bin/env zsh

################################################################################
# Copied from github.com/xylous/mzpm
################################################################################

readonly BIN_NAME="${$(basename "$0")%.*}"
[[ -z "${MZPMCACHE_DIR}" ]] \
    && readonly CACHE_DIR="${XDG_CACHE_HOME:-$HOME/.cache}/${BIN_NAME}"

# Call this function to automatically install and source the plugin
function plug_manager()
{
    for plug in "$@"; do
        # Check if plugin is already sourced; if true, then skip
        if [[ "${SOURCED_PLUGINS[@]}" =~ "${plug}" ]]; then
            continue
        else
            SOURCED_PLUGINS+=("${plug}")
        fi

        local plug_name="$(basename ${plug})"
        local install_dir="${CACHE_DIR}/${plug_name}"
        local plug_author="$(dirname ${plug})"
        if [[ ! -d "${install_dir}" ]]; then
            download_plugin_from_github "${plug_author}" "${plug_name}" "${install_dir}"
        else
            update_plugin_from_github "${plug_author}" "${plug_name}" "${install_dir}"
        fi
        load_zsh_plugin "${plug_name}" "${install_dir}"
    done
}

###
# Download a ZSH plugin from github
# Arguments:    $1: plugin author
#               $2: plugin name
#               $3: directory in which the plugin should be installed
###
function download_plugin_from_github()
{
    local plug_author="$1"
    local plug_name="$2"
    local install_dir="$3"
    local plug_link="https://github.com/${plug_author}/${plug_name}"

    echo "mzpm: downloading ${plug_author}/${plug_name}"
    git clone --depth=1 --shallow-submodule "${plug_link}" "${install_dir}" 2>/dev/null
}

###
# Update a ZSH plugin from github
# Arguments:    $1: plugin author
#               $2: plugin name
#               $3: directory in which the plugin should be updated
###
function update_plugin_from_github()
{
    local plug_author="$1"
    local plug_name="$2"
    local install_dir="$3"
    local plug_link="https://github.com/${plug_author}/${plug_name}"

    git -C "${install_dir}" fetch 2>/dev/null
    if [[ $(git -C "${install_dir}" rev-list ...origin --count) -ne 0 ]]; then
        echo "mzpm: updating ${plug_author}/${plug_name}"
        git -C "${install_dir}" pull --force 2>/dev/null
    fi
}

###
# Source a ZSH plugin
# Arguments:    $1: plugin name
#               $2: the directory the plugin was installed in
###
function load_zsh_plugin() {
    local plug_name="$1"
    local install_dir="$2"

    if [[ -f "${install_dir}/${plug_name}.plugin.zsh" ]]; then
        source "${install_dir}/${plug_name}.plugin.zsh"
    elif [[ -f "${install_dir}/${plug_name}.zsh" ]]; then
        source "${install_dir}/${plug_name}.zsh"
    elif [[ -f "${install_dir}/${plug_name}.zsh-theme" ]]; then
        source "${install_dir}/${plug_name}.zsh-theme"
    fi
}
