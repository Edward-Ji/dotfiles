#!/usr/bin/env zsh

################################################################################
# MIT License
# 
# Copyright (c) 2022 xylous <xylous.e@gmail.com>
# 
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
# 
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
# 
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.
################################################################################

readonly -i CURRENT_DATE=$(date +%s)
readonly BIN_NAME="${$(basename "$0")%.*}"
[[ -z "${MZPMCACHE_DIR}" ]] \
    && readonly CACHE_DIR="${XDG_CACHE_HOME:-$HOME/.cache}/${BIN_NAME}"
readonly LAST_UPDATE_PATH="${CACHE_DIR}/last_update"

# Call this function to automatically install and source the plugin
function plug_manager()
{
    if [[ -f "${LAST_UPDATE_PATH}" ]]; then
        # Check if the difference is greater than the set time for auto update
        # the time defaults to 7 days (604800 seconds)
        local -ri LAST_UPDATE=$(cat "${LAST_UPDATE_PATH}")
        local -ri UPDATE_DIFF=$(( ${CURRENT_DATE} - ${LAST_UPDATE} ))
        if [[ ${UPDATE_DIFF} -gt ${MZPM_AUTO_UPDATE:-604800} ]]; then
            local -r NEED_UPDATE=true;
        fi
    else
        local -r NEED_UPDATE=true;
    fi

    if [[ "${NEED_UPDATE}" = true ]]; then
        echo "mzpm: will check for updates..."
    fi

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
        elif [[ "${NEED_UPDATE}" = true ]]; then
            update_plugin_from_github "${plug_author}" "${plug_name}" "${install_dir}"
        fi
        load_zsh_plugin "${plug_name}" "${install_dir}"
    done

    if [[ "${NEED_UPDATE}" = true ]]; then
        echo "${CURRENT_DATE}" > "${LAST_UPDATE_PATH}"
    fi
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
