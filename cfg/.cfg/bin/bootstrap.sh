#!/bin/bash

function runIfNot() {
	pidof $1 > /dev/null || $@ &
}


feh --bg-scale ~/.cfg/images/wallpaper
wal -R
sxhkd $1 &
runIfNot polybar main 
runIfNot compton  
runIfNot conky  

