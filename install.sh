#!/bin/bash

config_dir="${XDG_CONFIG_HOME:-$HOME/.config}"
cache_dir="${XDG_CACHE_DIR:-$HOME/.cache}"
theme_dir="${XDG_CONFIG_HOME:-$HOME/.themes}"

# Copy themerc template
mkdir "$config_dir"/wal/templates/ 2> /dev/null
cp themerc "$config_dir"/wal/templates/themerc

# Generate a themerc from current wal colors
wal -nqi "$(< "$cache_dir"/wal/wal)"

# Copy theme bitmaps
mkdir -p "$theme_dir"
cp -r Walbox  "$theme_dir/Walbox"

# Symlink themerc
ln --symbolic "$cache_dir/wal/themerc" "$theme_dir/Walbox/openbox-3/themerc"
