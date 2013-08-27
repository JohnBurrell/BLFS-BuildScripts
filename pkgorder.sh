#!/bin/bash
./libraries.sh # libs with no dependencies
./multimedia.sh # for alsa and basic sound libraries
./security.sh # for openssl
./networks.sh # for wget
./programming.sh # for python2 (only install the binary for OpenJDK)
./sysutils.sh # for which, unzip
./libraries.sh # for glib
./genutils.sh # for pinentry, js.
./security.sh # for cacerts, openssh
./pst.sh # for docbook-xml,xsl
./programming.sh # for vala, py2-dbus and py3-dbus
./server.sh # for db, sqlite, apache and bind
#
# install x
#
./x.sh # install up to mesalib, which needs libdrm
./genutils.sh # for rarian and gtk-doc - completes all specified packages.
./sysutils.sh # reinstall systemd with gudev and bluez
./libraries.sh # for libdrm. Also installs libgusb which needs systemd with gudev
./x.sh # install the rest of x
#
./networks.sh # for neon, curl and netctl
./programming.sh # for cmake, git, php and subversion
./security.sh # for polkit, nss, cyrus-sasl - completes all specified packages
./xlibs.sh # for atk, cairo
./libraries.sh # for libical, harfbuzz, libgsf, poppler
./xlibs.sh # for pango, gtk+-2, gtk+-3
./sysutils.sh # for raptor, rasqal, redland, udisks, colord. Leaves ibus
./multimedia.sh # for gstreamer and plugins
./libraries.sh # for libglade, libunique, librsvg
./programming.sh # for python modules
./xsoftware.sh # for gimp, xdg-utils. Leaves icedtea-web.
./pst.sh # for cups - completes all specified packages
./xlibs.sh # for qt4
./networks.sh # for avahi, wpa_supplicant, samba
#
# most of the packages that do not depend on gnome have been installed
# so now install gnome platform

./gnomeplatform.sh
./networks.sh # for libsoup, networkmanager - completes all specified packages
./multimedia.sh # for libcanberra - completes all specified packages
./libraries.sh # for telepathy-mission - completes all specified packages
./sysutils.sh # for ibus - completes all specified packages
./xlibs.sh # for webkitgtk - leaves xulrunner
./programming.sh # for openjdk
#
./gnomedesktop.sh
./gnomeplatform.sh # completes all specified packages
./gnomedesktop.sh # completes all specified packages
./gnomeutils.sh # for gdm. Completes all packages
# if using sysvinit, then
./btscrpts.sh # install bootscripts for random, iptables, dbus, httpd, mysql, networkmanager, cups and bluetooth
./browser.sh # installs firefox
