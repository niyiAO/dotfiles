#!/bin/bash

function runIfNot() {
	pidof $1 > /dev/null || $@ &
}


wal -R
feh --bg-scale ~/.cfg/images/wallpaper
xbindkeys
runIfNot polybar main 
runIfNot compton  
runIfNot conky  

