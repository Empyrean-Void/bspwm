#!/usr/bin/env bash

# Import Current Theme
DIR="$HOME/.config/bspwm"
STYLE="gruvbox"
RASI="$DIR/themes/$STYLE/rofi/theme.rasi"

# List Available Themes
THEMES=(`cd $DIR/themes && ls -d */ | cut -d '/' -f1`)

# Theme Elements
prompt="Themes:"
mesg="<b>Available Themes</b> : `cd $DIR/themes && ls -d */ | cut -d '/' -f1 | wc -l`"

# Rofi CMD
rofi_cmd() {
	rofi -dmenu \
		-p "$prompt" \
		-mesg "$mesg" \
		-sep '|' \
		-markup-rows \
		-config ${RASI}
}

# Pass variables to rofi dmenu
run_rofi() {
	echo ${THEMES[@]} | sed 's/ /|/g' | sed 's/$/|/' | rofi_cmd
}

# Apply Theme
apply_theme() {
	selected="`run_rofi`"
	current="`cat $DIR/themes/.current`"

	for theme in "${THEMES[@]}"; do
		if [[ -z "$selected" ]]; then
			break
		elif [[ "$selected" == "$theme" ]]; then
			"$DIR"/themes/"$theme"/apply.sh
			break
		fi
	done
}

apply_theme && exit 0
