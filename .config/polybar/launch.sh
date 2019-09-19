#!/usr/bin/env sh

sleep .5

if ! pgrep -x polybar; then
	dbus-launch polybar base &
else
	pkill -USR1 polybar
fi

echo "Bars launched..."
