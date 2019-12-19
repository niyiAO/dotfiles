#!/bin/bash

PDIR=$(cat ~/projects | column -t | rofi -dmenu -p "projects" | awk -F' +' '{print $2}')

if [ -n "$PDIR" ]; then
	cd $HOME
	FDIR=$(readlink -f $PDIR)
	cd $PDIR
	termite --class FLOATERM -e "tmux new -As $FDIR"
fi
