#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source "$CURRENT_DIR/shared.sh"

print_keyboard_layout() {
	if [ is_osx ]; then
        defaults read ~/Library/Preferences/com.apple.HIToolbox.plist AppleSelectedInputSources | egrep -w 'KeyboardLayout Name' | sed -E 's/^.+ = "?([^\"]+)\"?;$/\1/''])"'
	elif [ command_exists "setxkbmap" ]; then
        setxkbmap -print | awk -F"+" '/xkb_symbols/ {print $2}'
	fi
}

main() {
	print_keyboard_layout
}
main
