#!/bin/bash
#
# This assumes you have installed xorg as per xorgInstallOrder.sh
./libraries.sh # libical gcab libgusb libgxps gspell librsvg babl. Also reinstall freetype for harfbuzz support
./sysutils.sh # bluez accountsservice colord modemmanager udisks upower
./multimedia.sh # lv2 sratom lilv sdl2 gstreamer-plugins libass libcanberra ffmpeg gst-libav pavucontrol
./pythonmodules.sh # py3-cairo pygobject3 py3-slip py3-matplotlib py3-atspi - completes specified packages
./xlibs.sh # libhandy gtk-vnc gtksourceview3 gtksourceview4 clutter clutter-gtk libdazzle gtk4 colord-gtk clutter-gst
./programming.sh # sysprof valgrind - completes specified packages
./pst.sh # mupdf
./xsoftware.sh #  xdg-utils
./pst.sh # cups, ghostscript
./xfcegnomeplatform.sh # dconf libsecret, gcr, gset-dsktp-schms, vte, libwnck3
./networks.sh # libsoup uhttpmock samba networkmanager libnma network-manager-applet
./libraries.sh # gegl libgrss appstream-glib
./xfceicons.sh # gnome-icon-thme lxde-icon-thme - completes specified packages
./java.sh # openjdk
./multimedia.sh # gst-plugins-good
./genutils.sh # ImageMagick and ibus - completes specified packages.
./qt5.sh # qt5-base, qt5-svg, t5-x11extras, qt5-declarative, qt5-script, qt5-tools, qt5-translations, qt5-multimedia, qt5-quickcontrols2, qt5-sensors, qt5-networkauth, qt5-wayland - completes specified packages
./xfcegnomeplatform.sh # rest
./networks.sh # kdsoap, avahi, geoclue - completes specified packages (don't need libnice)
#
./xlibs.sh # grantlee, webkit2gtk and wxtgk - completes specified packages
./xfcegnomeplatform.sh # goa, libgdata - completes specified packages
./security.sh # polkit-gnome - completes specified packages
./xfcegnomedesktop.sh # gexiv2 gvfs - completes specified packages
./xsoftware.sh # gimp
./libraries.sh # qca libportal poppler-qt5 - completes specified packages
./xfcexlibs.sh # keybinder3 - completes specified packages
./xfce.sh # libxfce4util xfconf libxfce4ui exo garcon thunar thunar-volman tumbler xfce4-appfinder xfce4-panel xfce4pwrmngr xfce4-settings xfdesktop xfwm4 xfce4-session xfce4-xkb-plugin parole mousepad xfce4-terminal xfburn ristretto xfce4-notifyd xfce4-screenshooter xfwm4-themes xfce4-pulse-plgn xfce4-whiskmenu-plgn xfce4-sensors-plgn xfce4-date-plgn - completes specified packages
#
./multimedia.sh # mlt v4l-utils pipewire vlc - completes specified packages (don't need farstream)
./server.sh # ucd
#
./pst.sh # cups-filters gutenprint sane xsane - completes specified packages
./sysutils.sh # weston notification-daemon - completes specified packages
./security.sh # polkit-gnome - completes specified packages
./browser.sh # install the Arch Linux chromium binary
#
# ******************************************************************
# *** install the following on the target machine, not in chroot ***
# ******************************************************************
#
./xsoftware.sh # thunderbird inkscape icedtea-web - completes specified packages 
#
# if using sysv
./btscrpts.sh # install bootscripts for random, dbus, httpd, mysql, networkmanager, cups and bluetooth
# if using systemd, need to do these:
systemctl enable acpid.service avahi-daemon.service bluetooth.service nftables.service ModemManager.service NetworkManager.service cups.service udisks2.service
# note - wpa_supplicant.service and dhcpcd.service will start at boot time
