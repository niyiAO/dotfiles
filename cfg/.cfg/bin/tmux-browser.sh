#!/bin/bash

WKSP="$HOME/docs/workspace"
PDIR=$(ls $WKSP | rofi -dmenu -p workspace)

if [ -n "$PDIR" ]; then
	cd "$WKSP/$PDIR"
	$TERMINAL --class FLOATERM -e tmux new -As $PWD &
fi

