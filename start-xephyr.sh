#!/bin/sh -e

#Fremantle
#exec /usr/bin/Xephyr :2 -nolisten tcp -host-cursor -screen 800x480x16 -dpi 96 -ac +extension Composite +extension XFIXES +extension DAMAGE +extension RENDER +extension GLX

#Harmattan
if [ "$1" == "portrait" ] ; then
	Xephyr :2 -host-cursor -screen 480x854x16 -dpi 96 -ac +extension Composite &
else
	Xephyr :2 -host-cursor -screen 854x480x16 -dpi 96 -ac +extension Composite &
fi

#sleep 1
#matchbox-window-manager -use_titlebar no -display :2 &
#xcompmgr -d :2 &
