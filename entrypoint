#!/bin/bash
set -e

CURRENT_USER="admin"
CURRENT_UID=$(id -u "$CURRENT_USER")
CURRENT_GID=$(id -g "$CURRENT_USER")
readonly CURRENT_USER CURRENT_UID CURRENT_GID

if [[ -n "$TARGET_GID" && "$TARGET_GID" -ne "$CURRENT_GID" ]]; then
    echo "Updating GID to $TARGET_GID..."
    groupmod --gid "$TARGET_GID" --non-unique "$CURRENT_USER"
    echo "Updating file group ownership..."
    find / -xdev -group "$CURRENT_GID" -exec chgrp -h "$TARGET_GID" {} ";"
fi

if [[ -n "$TARGET_UID" && "$TARGET_UID" -ne "$CURRENT_UID" ]]; then
    echo "Updating UID to $TARGET_UID..."
    usermod --uid "$TARGET_UID" --gid "$TARGET_GID" --non-unique "$CURRENT_USER"
    echo "Updating file user ownership..."
    find / -xdev -user "$CURRENT_UID" -exec chown -h "$TARGET_UID" {} ";"
fi

exec sudo -u "$CURRENT_USER" -- "$@"
