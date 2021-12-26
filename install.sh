#!/bin/bash

config_dir="${XDG_CONFIG_HOME:-$HOME/.config}"
cache_dir="${XDG_CACHE_DIR:-$HOME/.cache}"

# Copy themerc template
mkdir "$config_dir"/wal/templates/ 2> /dev/null
cp themerc "$config_dir"/wal/templates/themerc

# Generate a themerc from current wal colors
wal -nqi "$(cat "$cache_dir"/wal/wal)"

# Copy theme bitmaps
cp -r Walbox ~/.themes/Walbox

# Symlink themerc
ln --symbolic "$cache_dir/wal/themerc" "$HOME/.themes/Walbox/openbox-3/themerc"
