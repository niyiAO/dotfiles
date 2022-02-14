#!/bin/bash


# lock="Lock"
# reboot="Reboot"

shutdown="襤"
reboot="勒"
lock=""
hibernate=""

if [ -z "$@" ]; then
	cat <<-END
		$hibernate
		$shutdown
		$suspend
		$lock
		$reboot
	END
fi

case $@ in
	$hibernate)
		dm-tool lock
		systemctl hibernate
		;;
	$shutdown)
		systemctl poweroff
		;;
	# $suspend)
	# 	dm-tool lock
	# 	systemctl suspend
	# 	;;
	$lock)
		dm-tool lock
		;;
	$reboot)
		systemctl reboot
esac
