#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

#xrandr --setprovideroutputsource modesetting NVIDIA-0
#xrandr --auto

if [ -d /etc/X11/xinit/xinitrc.d ]; then
        for f in /etc/X11/xinit/xinitrc.d/*; do
                [ -x "$f" ] && . "$f"
        done
        unset f
fi

# Here gnome is the default
session=${1:-gnome}
dbus="dbus-launch --exit-with-session"
ck="ck-launch-session dbus-launch --exit-with-session"

case $session in
    dwm               ) exec dwm;;
    enlightenment     ) exec enlightenment_start;;
    fluxbox           ) exec startfluxbox;;
    gnome             ) exec $dbus gnome-session;;
    i3|i3wm           ) exec i3;;
    icewm             ) exec icewm-session;;
    jwm               ) exec jwm;;
    kde5|plasma       ) exec $ck startkde;;
    lxde              ) exec ck-launch-session startlxde;;
    lxqt2             ) exec $dbus startlxqt;;
    mate              ) exec mate-session;;
    monster|monsterwm ) exec monsterwm;;
    openbox           ) exec openbox-session;;
    unity             ) exec unity;;
    xfce|xfce4        ) exec startxfce4 --with-ck-launch;;
    sawfish           ) exec sawfish;
    xmonad            ) exec xmonad;;
    twm               ) xterm  -g 80x40+0+0   &
	                xclock -g 100x100-0+0 &
			twm;;
    # No known session
    *) echo "Cannot run $1";;
esac
