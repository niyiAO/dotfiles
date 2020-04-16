#!/bin/bash

PDIR=$(cat ~/docs/projects | column -t | rofi -dmenu -p "projects" | awk -F' +' '{print $2}')

if [ -n "$PDIR" ]; then
	cd $HOME
	FDIR=$(readlink -f $PDIR)
	cd $PDIR
	$TERMINAL --class FLOATERM -e tmux new -As $FDIR
fi
