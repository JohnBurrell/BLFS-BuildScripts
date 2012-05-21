#!/bin/bash
./libraries.sh # libs with no dependencies
./security.sh # for openssl
./programming.sh # for python
./libraries.sh # for glib
./programming.sh # for pkg-config
./networks.sh # for wget
./security.sh # for cacerts
./libraries.sh # for gobject-introspection
./genUtils.sh # for intltool
./sysUtils.sh # for unzip
./pst.sh # for docbook-xml,xsl
./server.sh # for db, sqlite, apache
./security.sh # for nss
./libraries.sh # for aspell
./genUtils.sh # for rarian
./sysUtils.sh # for udisks
./programming.sh # for perl modules
./networks.sh # for curl
./programming.sh # for cmake
./server.sh # for mysql
./x.sh # installs up to mesalib, which needs libdrm
./libraries.sh # for libdrm
./x.sh # installs the rest of x
./xlibs.sh # atk, cairo, pango, gtk+
./sysUtils.sh # for dbus
./multimedia.sh
./security.sh # for liboauth, consolekit
./libraries.sh # for colord, libunique and telepathy...
./genUtils.sh # for icon-naming-utils
./programming.sh # for python modules
./xlibs.sh # for qt4
./networks.sh # for avahi
./multimedia.sh # for vlc
./pst.sh # for libgxps
./gnomePlatform.sh
./programming.sh # for pyatspi
./networks.sh # for glib-networking, libsoup, librest, geocode-glib, libgdata, networkmanager
./xlibs.sh # for webkitgtk
