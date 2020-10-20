#!/bin/bash

function runIfNot() {
	pidof $1 > /dev/null || $@ &
}

~/.fehbg &
wal -Rn

killall sxhkd
sxhkd $1 &
runIfNot udiskie &
runIfNot polybar main 
runIfNot compton  
runIfNot xfce4-power-manager
