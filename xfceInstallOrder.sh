#!/bin/bash
#
# This assumes you have installed xorg as per xorgInstallOrder.sh
./pythonmodules.sh # py3-cairo pygobject3 py3-slip py3-matplotlib py3-atspi - completes specified packages
./sysutils.sh # bluez accountsservice colord modemmanager seatd udisks upower
./multimedia.sh # lv2 sratom lilv gst-plugins-base gst-plugins-bad gst-plugins-ugly pulseaudio libass libcanberra espeak-ng SDL2 sdl12-compat (smpeg) ffmpeg gst-libav pavucontrol libvdpau-va-gl
./xsoftware.sh #  xdg-utils
./pst.sh # mupdf cups ghostscript libspectre
./xlibs.sh # gtk-layer-shell libhandy gtk-vnc gtksourceview4 gtk4 gtksourceview5 colord-gtk libadwaita qt5
./xfcegnomeplatform.sh # libsecret, gcr3, gset-dsktp-schms, vte, libwnck3 gcr4
./networks.sh # libproxy  glib-networking iwgtk libsoup2 uhttpmock samba nmap libsoup3 networkmanager libnma netwrk-mngr-app kdsoap avahi  geoclue - completes specified packages
./libraries.sh # gegl libgrss appstream-glib qca libportal poppler-qt5 - completes specified packages
./xfceicons.sh # gnome-icon-thme gnm-themes-extra lxde-icon-thme papirus-icon-theme - completes specified packages
./java.sh # openjdk
./multimedia.sh # gst-plugins-good mlt v4l-utils pipewire vlc - completes specified packages
./xfcegnomedesktop.sh # dconf gexiv2 gvfs - completes specified packages
./genutils.sh # ImageMagick and ibus - completes specified packages.
./xfcegnomeplatform.sh # rest
#
./xlibs.sh # grantlee tepl webkit2gtk - completes specified packages
./xfcegnomeplatform.sh # goa, libgdata - completes specified packages 
./security.sh # polkit-gnome - completes specified packages
./xsoftware.sh # gimp
./xfcexlibs.sh # keybinder3 - completes specified packages
./x.sh # cantarell-fonts - completes specified packages
./xfce.sh # libxfce4util xfconf libxfce4ui exo garcon thunar thunar-volman tumbler xfce4-appfinder xfce4-panel xfce4pwrmngr xfce4-settings xfdesktop xfwm4 xfce4-session - completes specified packages
./xfceapps.sh # parole mousepad xfce4-terminal xfburn ristretto xfce4-notifyd xfce4-xkb-plugin xfce4-screenshooter xfwm4-themes materia-gtk-theme xfce4-pulse-plgn xfce4-whiskmenu-plgn xfce4-sensors-plgn xfce4-date-plgn qpdfview - completes specified packages
#
./server.sh # ucd - completes specified packages
#
./pst.sh # libcupsfilters libppd cups-filters gutenprint sane simple-scan - completes specified packages
./sysutils.sh # weston notification-daemon - completes specified packages
./xfcegnomeapps.sh # aisleriot xboard gnuchess gnome-chess - completes specified packages
./browser.sh # chromium, installed from the chromium website
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
systemctl enable acpid.service avahi-daemon.service bluetooth.service nftables.service
systemctl enable ModemManager.service NetworkManager.service cups.service udisks2.service
systemctl disable wpa_supplicant.service # if you want to use iwd for internet access
