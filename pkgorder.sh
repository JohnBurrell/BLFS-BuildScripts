#!/bin/bash
#
# The rationale is to get x installed early
# Other considerations are that python needs tk to use IDLE
# tk needs x libraries and xcb-proto needs python installed.
# the solution here is to install python2 and 3 early but not to install any python modules until tk is installed.
# Once x libs are installed, then install tk and then reinstall python 2 and 3.
# ** NOTE ** do not move the position of tk - it has to come before python2 in order
# that python2 and 3 are reinstalled after tk is installed.
# python modules can then be installed 
./libraries.sh # libs with no dependencies
./multimedia.sh # for alsa and basic sound libraries
./security.sh # for openssl and sudo
./networks.sh # for wget
./programming.sh # for perl modules, python2, tcl, llvm, python3
./sysutils.sh # for which, unzip
./libraries.sh # for glib
./java.sh # only the binary for OpenJDK is installed at this stage
./genutils.sh # for pinentry, tidy, dialog, qtchooser
./security.sh # for cacerts, openssh
./pst.sh # for docbook-xml,xsl
./programming.sh # for vala and xml-simple
./server.sh # for db, sqlite, apache and bind
#
# install x
#
./x.sh # install up to mesalib, which needs libdrm
./genutils.sh # for rarian and gtk-doc - leaves imagemagick 
./sysutils.sh # reinstall systemd with gudev and dbus for dbus-launch
./libraries.sh # for libmbim, dbus-glib and libgusb which needs systemd with gudev
./xlibs.sh # for libdrm, atk, atkmm, shared-mime-info, gdk-pixbuf and at-spi2
./networks.sh # for neon, curl and netctl
./programming.sh # for tk, python2 and 3, cmake, git, php and subversion
./multimedia.sh # for smpeg, libcdio, opal, libvdpau and gstreamer
./x.sh # install up to xorg-server which needs libepoxy
./xlibs.sh # for cairo, cairomm, glu, freeglut, libepoxy
./x.sh # install the rest of x
#
./security.sh # for polkit, nss, cyrus-sasl, liboauth - completes specified packages
./libraries.sh # for libical, harfbuzz, libgsf, poppler
./xlibs.sh # for pango, gtk+2, gtk+3, clutter, clutter-gtk
./sysutils.sh # for raptor, rasqal, redland, udisks, upower and colord.
./libraries.sh # for libglade, librsvg and reinstall freetype. Leaves openobex
./multimedia.sh # for gstreamer plugins, gst-libav and libass
./programming.sh # for remaining python modules and pysol - completes specified packages
./xsoftware.sh # for gimp, xdg-utils. Leaves icedtea-web and pidgin.
./pst.sh # for cups - completes specified packages
./server.sh # for mysql and openldap - completes specified packages
./xlibs.sh # for colord-gtk, clutter-gst and qt4
./networks.sh # for wpa_supplicant, samba, wpa_supplicant and avahi.
./sysutils.sh # for bluez
./libraries.sh # for openobex - completes specified packages`
./sysutils.sh # for obexds. Leaves ibus
./telepathy.sh # for telepathy-glib, telepathy-logger and telepathy-idle
#
# most of the packages that do not depend on gnome have been installed
# now install gnome platform
#
./gnomeplatform.sh # installs up to libwnck - need libsoup next.
./networks.sh # for glib-networking, libsoup, networkmanager, geoclue - completes specified packages
./multimedia.sh # for v4l, libcanberra, pulseaudio, ffmpeg and vlc. Leaves grilo-plugins
./xsoftware.sh # for pidgin
./telepathy.sh # farstream, gabl, salut and haze - completes specified packages
./sysutils.sh # for ibus - completes specified packages
./genutils.sh # for appstream-glib, appdata-tools and ImageMagick - completes specified packages
./xsoftware.sh # for inkscape. Leaves icedtea-web.
./xlibs.sh # for webkitgtk2 and notification-daemon - completes specified packages
./java.sh # for openjdk - completes specified packages
#
./gnomeplatform.sh # completes specified packages
./gnomeapps.sh # for baobab, gedit, gnome-calculator, up to gnome-chess
./gnomedesktop.sh # for caribou, up to yelp
./gnomeapps.sh # for brasero to evolution.
./gnomedesktop.sh # for bluetooth, control-center and gnome-shell - completes specified packages
./gnomeapps.sh # for terminal and user-share - completes specified packages
./multimedia.sh # for grilo-plugins -  - completes specified packages
# if using sysvinit, then
./btscrpts.sh # install bootscripts for random, iptables, dbus, httpd, mysql, networkmanager, cups and bluetooth
# if using systemd, need to activate these using systemctl enable <service name>
./browser.sh # installs firefox or seamonkey. Choose chromium if depot_tools and the src dir are in place.
./xsoftware.sh # for icedtea-web - completes all specified packages
