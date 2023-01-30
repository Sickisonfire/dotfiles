#!/bin/sh
 
if [[ -n $1 ]]; then
    xdg-open https://duckduckgo.com/?q="$*"
fi

# run with
#rofi -show find -modes "find:~/.config/rofi/websearch.sh" -theme config.rasi 

