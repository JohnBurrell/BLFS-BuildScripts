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
#
./libraries.sh # libs with no dependencies
./multimedia.sh # for alsa and basic sound libraries
./security.sh # for openssl and sudo
./networks.sh # for wget
./programming.sh # for perl modules, python2, tcl, llvm, python3
./sysutils.sh # for which, unzip
./libraries.sh # for glib
./java.sh # only the binary for OpenJDK is installed at this stage
./genutils.sh # for pinentry, tidy, iso-codes, dialog, shared-mime-info
./security.sh # for cacerts, openssh
./pst.sh # for docbook-xml,xsl
./programming.sh # for vala and xml-simple
./server.sh # for db, sqlite, apache and bind
./security.sh # for polkit, nss, cyrus-sasl
./server.sh # for openldap - leaves mariadb
./security.sh # for gnupg, krb5 and gpgme. Leaves liboauth or consolekit if using init.d
./networks.sh # for neon, curl and reinstall wget for gnutls support
#
# install x
#
./x.sh # install up to mesalib, which needs libdrm
./genutils.sh # for rarian, gtk-doc, tdb - leaves imagemagick and ibus
./sysutils.sh # reinstall systemd with gudev, dbus for dbus-launch and udisks
./libraries.sh # for libmbim, dbus-glib and libgusb which needs systemd with gudev
./networks.sh # for netctl and links
./programming.sh # for tk, python2 and 3, cmake, git, php and subversion
./xlibs.sh # for libdrm, atk, atkmm, gdk-pixbuf and at-spi2
./multimedia.sh # for speex, smpeg, libcdio, libvdpau and gstreamer
./x.sh # install up to xorg-server which needs libepoxy
./xlibs.sh # for cairo, cairomm, glu, freeglut, libepoxy
./x.sh # install the rest of x
#
./security.sh # for liboauth or consolekit if using init.d - completes specified packages
./libraries.sh # for libical, harfbuzz, libgsf, poppler and jasper
./xlibs.sh # for pango, gtk+2, gtk+3, clutter, clutter-gtk
./sysutils.sh # for raptor, rasqal, redland, udisks, upower and colord.
./libraries.sh # for libglade, librsvg and reinstall freetype. Leaves appstream-glib and openobex
./multimedia.sh # for gstreamer plugins, gst-libav, libass and libcanberra
./programming.sh # for remaining python modules and pysol - completes specified packages
./xsoftware.sh # for gimp, xdg-utils. Leaves icedtea-web and pidgin.
./pst.sh # for cups - completes specified packages
./server.sh # for mariadb - completes specified packages
./sysutils.sh # for bluez - completes specified packages
./libraries.sh # for openobex. Leaves appstream-glib
./networks.sh # for wpa_supplicant, samba and avahi.
# for gnome
./telepathy.sh # for telepathy-glib, telepathy-logger and telepathy-idle
# for xfce
./xfcegnome.sh # if using xfce, gnome packages for xfce
#
./gnomeplatform.sh # installs up to libwnck - need libsoup next.
./networks.sh # for glib-networking, libsoup, geoclue2 and uhttpmock
./xlibs.sh # for colord-gtk, clutter-gst, qt4 and webkitgtk - completes specified packages
./libraries.sh # for appstream-glib - completes specified packages
./multimedia.sh # for v4l, libcanberra, pulseaudio, ffmpeg and vlc - leaves grilo-plugins if systemd
./genutils.sh # for ImageMagick and ibus - completes specified packages
./java.sh # for openjdk - completes specified packages
./browser.sh # for firefox
./xsoftware.sh # for thunderbird and pidgin
./telepathy.sh # if installing gnome, farstream, gabl, salut and haze - completes specified packages
./xsoftware.sh # for inkscape. Leaves icedtea-web.
./xlibs.sh # for webkitgtk and notification-daemon - completes specified packages
# for xfce
./xfce.sh # if instaling xfce instead of gnome
#
./gnomeplatform.sh # for totem-pl-parser to folks - completes specified packages
./gnomedesktop.sh # for caribou to gnome-shell - completes specified packages
./gnomeapps.sh # for baobab to gnome-user-share - completes specified packages
./btscrpts.sh # if using sysvinit - install bootscripts for random, iptables, dbus, httpd, mysql, networkmanager, cups and bluetooth
# if using systemd, need to activate these using systemctl enable <service name>
