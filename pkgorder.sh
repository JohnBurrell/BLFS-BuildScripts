#!/bin/bash
./libraries.sh # libs with no dependencies
./security.sh # for openssl
./programming.sh # for python (only install the binary for OpenJDK)
./libraries.sh # for glib
./networks.sh # for wget
./security.sh # for cacerts
./genutils.sh # for intltool
./sysutils.sh # for unzip
./pst.sh # for docbook-xml,xsl
./server.sh # for db, sqlite, apache
./security.sh # for nss
./libraries.sh # for aspell
./genutils.sh # for rarian
./security.sh # for polkit
./sysutils.sh # for udisks
./programming.sh # for llvm and perl modules
./networks.sh # for curl
./programming.sh # for cmake
./server.sh # for mysql - completes all specified packages
./security.sh # for liboauth
./genutils.sh # for  icon-naming-utils - completes all specified packages
./sysutils.sh # for raptor, rasqal, redland, apache-ant
./multimedia.sh # for alsa, basic libraries and gstreamer
./x.sh # installs up to mesalib, which needs libdrm
./libraries.sh # for libdrm
./x.sh # installs the rest of x
./xlibs.sh # for atk, cairo
./libraries.sh # for harfbuzz
./xlibs.sh # for pango, gtk+-2
./sysutils.sh # for dbus
./security.sh # for consolekit - completes all specified packages
./libraries.sh # telepathy-glib
./programming.sh # for python modules
./multimedia.sh # for gst-plugins
./xlibs.sh # for gtk+-3 qt4
./networks.sh # for avahi
./pst.sh # for cups, cups-filters
./programming.sh # for pyatspi - completes all specified packages
./libraries.sh # for libunique, librsvg
./networks.sh # for samba
./xsoftware.sh # for the gimp
./pst.sh # for gutenprint - completes all specified packages
# all packages that do not depend on gnome have been installed
# now install gnome platform
./gnomeplatform.sh
./networks.sh # for libsoup, networkmanager - completes all specified packages
./multimedia.sh # for libcanberra - completes all specified packages
./libraries.sh # for telepathy-mission - completes all specified packages
./sysutils.sh # for ibus - completes all specified packages
./xlibs.sh # for webkitgtk
./gnomedesktop.sh
./gnomeplatform.sh # completes all specified packages
./gnomedesktop.sh  # completes all specified packages
./gnomeutils.sh # completes all specified packages
./btscrpts.sh # install bootscripts for random, iptables, dbus, httpd, mysql, networkmanager and cups
./browser.sh # installs firefox
