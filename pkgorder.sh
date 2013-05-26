#!/bin/bash
./libraries.sh # libs with no dependencies
./multimedia.sh # for alsa and basic sound libraries
./security.sh # for openssl
./networks.sh # for wget
./programming.sh # for python2 (only install the binary for OpenJDK)
./libraries.sh # for glib
./sysutils.sh # for which, unzip
./pst.sh # for docbook-xml,xsl
./genutils.sh # for pinentry, spidermonkey. Completes all specified packages
./security.sh # for cacerts, openssh
#
./networks.sh # for neon and curl
./programming.sh # for cmake, git, vala
./server.sh # for db, sqlite, apache, bind and mysql
./security.sh # if systemd - completes all specified packages. Leaves consolekit.
./server.sh # for openldap. Completes all specified packages
./sysutils.sh # reinstall systemd for gudev
#
# install x
#
./x.sh # install up to mesalib, which needs libdrm
./libraries.sh # for libdrm
./x.sh # install the rest of x
#
./xlibs.sh # for atk, cairo
./libraries.sh # for harfbuzz, libgsf, poppler
./xlibs.sh # for pango, gtk+-2, gtk+3
#
./multimedia.sh # for gstreamer and gst-plugins
./sysutils.sh # for colord
./xlibs.sh # for qt4
./libraries.sh # for libglade, libunique and librsvg. Leaves telepathy-fstream and missn
./programming.sh # for pygtk. Completes all specified packages
./xsoftware.sh # for gimp and xdg-utils. Completes all specified packages
./pst.sh # for cups. Completes all specified packages
./networks.sh # for avahi, wpa and samba

# all packages that do not depend on gnome have been installed
# now install gnome platform

./gnomeplatform.sh
./networks.sh # for libsoup, networkmanager - completes all specified packages
./multimedia.sh # for libcanberra - completes all specified packages
./libraries.sh # for telepathy-mission - completes all specified packages
./sysutils.sh # for ibus - completes all specified packages
./xlibs.sh # for webkitgtk - completes all specified packages
./gnomedesktop.sh
./gnomeplatform.sh # completes all specified packages
./gnomedesktop.sh # completes all specified packages
./gnomeutils.sh # for gdm. Completes all packages
# if using sysvinit, then
./btscrpts.sh # install bootscripts for random, iptables, dbus, httpd, mysql, networkmanager, cups and bluetooth
./browser.sh # installs firefox
