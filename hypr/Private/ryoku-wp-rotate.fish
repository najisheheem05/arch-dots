#!/usr/bin/env fish
# Steps through wallpapers in ~/Pictures/Wallpapers in order (alphabetical,
# not random), advancing one wallpaper per session, and sets them via
# `ryogami wallpaper set <path>`.

set -l wallpaper_dir "$HOME/Pictures/Wallpapers"
set -l state_file "$HOME/.cache/ryoku-wp-rotate/-rotate/last"

mkdir -p (dirname "$state_file")

set -l wallpapers (find "$wallpaper_dir" -maxdepth 1 -type f \( \
    -iname '*.jpg' -o -iname '*.jpeg' -o -iname '*.png' -o \
    -iname '*.webp' -o -iname '*.gif' \) | sort)

if test (count $wallpapers) -eq 0
    echo "wallpaper-rotate: no images in $wallpaper_dir" >&2
    exit 1
end

set -l last ""
if test -f "$state_file"
    set last (cat "$state_file")
end

# Find where we left off and advance one step, wrapping to the start.
# If the stored path isn't in the current list (first run, or the file
# was deleted/renamed), start over from the first wallpaper.
set -l next_index 1
set -l last_index (contains -i -- "$last" $wallpapers)
if test -n "$last_index"
    set next_index (math $last_index % (count $wallpapers) + 1)
end

set -l chosen $wallpapers[$next_index]

ryogami wallpaper set "$chosen"

echo "$chosen" >"$state_file"
