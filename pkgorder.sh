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
./genutils.sh # for pinentry, js.
./security.sh # for cacerts, openssh
./pst.sh # for docbook-xml,xsl
./programming.sh # for vala and xml-simple
./server.sh # for db, sqlite, apache and bind
#
# install x
#
./x.sh # install up to mesalib, which needs libdrm
./genutils.sh # for rarian and gtk-doc - leaves imagemagick 
./sysutils.sh # reinstall systemd with gudev
./libraries.sh # for libgee, libgusb which needs systemd with gudev
./xlibs.sh # for libdrm, atk, atkmm, shared-mime-info
./networks.sh # for neon, curl and netctl
./programming.sh # for tk, python2 and 3, cmake, git, php and subversion
./wayland.sh # mesalib needs wayland in this build (currently disabled in the book)
./x.sh # install the rest of x
#
./security.sh # for polkit, nss, cyrus-sasl, liboauth - completes specified packages
./xlibs.sh # for cairo, cairomm
./libraries.sh # for libical, harfbuzz, libgsf, poppler
./xlibs.sh # for pango, gtk+2, gtk+3, clutter, clutter-gtk
./sysutils.sh # for raptor, rasqal, redland, udisks, upower and colord.
./multimedia.sh # for gstreamer and plugins
./libraries.sh # for libglade, librsvg
./programming.sh # for remaining python modules and pysol - completes specified packages
./xsoftware.sh # for gimp, xdg-utils. Leaves icedtea-web.
./pst.sh # for cups - completes specified packages
./server.sh # for mysql and openldap - completes specified packages
./xlibs.sh # for colord-gtk, clutter-gst, qt4 and xulrunner
./networks.sh # for wpa_supplicant, samba
./sysutils.sh # for bluez and obexd. Leaves ibus
#
# most of the packages that do not depend on gnome have been installed
# now install gnome platform
#
./gnomeplatform.sh
./networks.sh # for libsoup, networkmanager, geoclue, squid - completes specified packages
./multimedia.sh # for v4l, libcanberra, pulseaudio, ffmpeg - completes specified packages
./libraries.sh # for telepathy-farstream and mission-control - completes specified packages
./sysutils.sh # for ibus - completes specified packages
./genutils.sh # for ImageMagick - completes specified packages
./wayland.sh # for weston - completes specified packages
./xlibs.sh # for webkitgtk2
./java.sh # for junit and openjdk - completes specified packages
#
./gnomedesktop.sh
./gnomeplatform.sh # completes specified packages
./gnomedesktop.sh # completes specified packages
./gnomeutils.sh # for gdm - completes specified packages
# if using sysvinit, then
./btscrpts.sh # install bootscripts for random, iptables, dbus, httpd, mysql, networkmanager, cups and bluetooth
# if using systemd, need to activate these using systemctl enable <service name>
./browser.sh # installs firefox or seamonkey
./xsoftware.sh # for icedtea-web - completes all specified packages
