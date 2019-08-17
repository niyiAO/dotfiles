#!/bin/bash


if [ -z "$@" ]; then
	cat <<-END
		Hibernate
		Shutdown
		Suspend
		Lock
		Reboot
	END
fi

case $@ in
	Hibernate)
		dm-tool lock
		systemctl hibernate
		;;
	Shutdown)
		systemctl poweroff
		;;
	Suspend)
		dm-tool lock
		systemctl suspend
		;;
	Lock)
		dm-tool lock
		;;
	Reboot)
		systemctl reboot
esac
