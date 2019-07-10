#!/bin/bash
#
# The rationale is to get x installed reasonably early, but
# other considerations are that python needs tk to use IDLE
# tk needs x libraries and xcb-proto needs python installed.
# the solution here is to install python2 and 3 early but not to install any python modules
# until tk is installed.
# Once x libraries are installed, then install tk and then reinstall python 2 and 3.
# ** NOTE ** do not move the position of tk - it has to come before python2 in order
# that python2 and 3 are reinstalled after tk is installed.
# python modules can then be installed
# wget is reinstalled after gnutls is installed.
./libraries.sh # libs with no dependencies - installs to libxml2
./multimedia.sh # alsa and basic sound libraries - installs to libcddb. jack is next - needs db
./server.sh # db, sqlite, and apache. Next is openldap which needs cyrus-sasl
./security.sh # iptables, nettle, cracklib, linux-pam, sudo, nss ... p11-kit, libpwquality
./networks.sh # dhcpcd, net-tools, wget, libndp, libnl, wireless-tools, traceroute ... curl, nghttp2
./security.sh # cacerts, openssh, p11-kit, gnutls, liboauth
./networks.sh # wget with gnutls support, iw and neon
./security.sh # pkcs11-helper and nss-mdns
./programming.sh # archive-zip, nasm, uri, slang, python2, tcl, perl modules, gdb, git, ... php
./sysutils.sh # which, cpio, sg3_utils, unzip, zip, pciutils, usbutils, pm-utils ... rasqal, redland
./libraries.sh # libsass, libssh2, boost, exempi, freetype, fontconfig, talloc, wayland, ... newt 
./java.sh # Oracle binary (12.0.1)
./genutils.sh # pinentry, dialog, rpmextract, iso-codes, bogofilter ... graphviz. Reinstall grep with pcre support
./networks.sh # libpsl, serf
./pst.sh # docbook-xml, docbook-xsl, itstool, sgml-common and opensp
./libraries.sh # libxslt, glib, libcroco, gobject-intro, gmime3, json-glib, glibmm ... mypaint-brushes
./programming.sh # cmake, doxygen, llvm, subversion, rustc, cbindgen and vala
./libraries.sh # yaml, exiv2, libjpeg-turbo, libmng, qpdf, gegl, rapidjson, libtiff, ... openjpeg2
./server.sh # openldap and mariadb - completes specified packages
./icons.sh # hicolor-icon-theme, icon-naming-utils and adwaita-icon-theme
./security.sh # gnupg, krb5, gpgme and volume_key. Leaves polkit
./pythonmodules.sh # cssselect to sklearn 
#
# install x
#
./x.sh # install up to libva, which needs libdrm
./genutils.sh # rarian, gtk-doc, tdb and tidy - leaves imagemagick and ibus
./sysutils.sh # systemd with gudev, dbus, bluez. udisks is next
./libraries.sh # js52, js60, libmbim, libqmi, libbytesize, libblockdev, dbus-glib, jasper and libwacom
./security.sh # polkit - completes specified packages
./networks.sh # reinstall wpa_supplicant. Install c-ares, squid, netctl, links, libproxy and openvpn
./programming.sh # tk and reinstall python2 and 3 for idle support, valgrind, nodejs and vala
./pythonmodules.sh # py-xdg, py-dbus
./xlibs.sh # libdrm, atk, atkmm, gdk-pixbuf, at-spi2 and imlib2
./multimedia.sh # jack, libcdio, speex, gstreamer, libvpx, x264, x265, pulseaudio, espeak, speechd, smpeg
./x.sh # install up to xorg-server which needs libepoxy
./xlibs.sh # cairo, cairomm, glu, freeglut, libepoxy
./x.sh # install the rest of x
#
./libraries.sh # gcab, libgusb, harfbuzz, libgsf, libxkbcommon and poppler
./xlibs.sh # pango, cogl, gtk+2, gtk+3, libnotify, gtk-vnc, clutter and clutter-gtk
./libraries.sh # librsvg. Also reinstall freetype for harfbuzz support
./sysutils.sh # udisks, upower, colord, modemmanager and weston - completes specified packages
./multimedia.sh # gstreamer plugins, gst-libav, libass, libcanberra and ffmpeg
./pythonmodules.sh # py-cairo, py-gobject, py-matplotlib, pyatspi and pygtk. Leaves py3-pyqt5
./programming.sh # perl-glib and pysol - leaves codelite and cuda
./xsoftware.sh #  xdg-utils 
./pst.sh # xmlto and mupdf
./gnomeplatform.sh # gnome-common up to libpeas (Note, gimp now (2018) needs gexiv2)
./networks.sh # libnice, samba, avahi, glib-networking, libsoup, uhttpmock, geoclue2 and networkmanager 
./xsoftware.sh # gimp and thunderbird
./pst.sh # cups, ghostscript, mudpdf and cups-filters
./libraries.sh # openobex. Leaves appstream-glib
./icons.sh # gnome-icon-theme, extras, symbolic and gnome-themes-extra - completes specified packages
# for gnome and openelec
./telepathy.sh # telepathy-glib, telepathy-logger
# for xfce
./xfcegnomeplatform.sh # if using xfce, gnomeplatform packages for xfce
#
# if installing kodi then
./openelec.sh # libdcadec, glew, setconf, tinyxml, p8-platform, libmicrohttpd and libcrossguid
#
./libraries.sh # appstream-glib - completes specified packages
./java.sh # openjdk
./multimedia.sh # grilo, gst-plugins-good and farstream.
./genutils.sh # ImageMagick and ibus - completes specified packages
# for gnome and openelec
./telepathy.sh # mission-control - completes specified packages
#
./xlibs.sh # clutter-gst, qt5, webkit2gtk and wxtgk
#
# for xfce
./xfcegnomedesktop.sh # gnomedesktop packages for xfce
./xfce.sh
#
# for openelec (if using a window manager other than gnome)
./windowmanager.sh # fluxbox, openbox, i3-wm and menumaker - completes specified packages
#
# for gnome and openelec
./gnomeplatform.sh # totem-pl-parser to tracker - completes specified packages
./multimedia.sh # v4l-utils, vlc and grilo-plugins - completes specified packages
./server.sh # pipewire - completes specified packages
./gnomedesktop.sh # caribou to gnome-shell. Leaves gnome-control-center
# for gnome
./gnomeapps.sh # baobab to seahorse - completes specified packages
./gnomedesktop.sh # gnome-control-center -completes specified packages
#
./multimedia.sh # v4l-utils, vlc and grilo-plugins - completes specified packages
./pythonmodules.sh # py3-pyqt5 - completes specified packages
./pst.sh # gutenprint, sane and xsane - completes specified packages
#
# ******************************************************************
# *** install the following on the target machine, not in chroot ***
# ******************************************************************
#
# for openelec
./openelec.sh # kodi and the encoders - completes specified packages
#
./programming.sh # rustc, codelite and cuda - completes specified packages
./browser.sh # firefox and chromium
./xsoftware.sh # inkscape and icedtea-web - completes specified packages 
./nvidia.sh # nvidia modules - needed if using CUDA
./java.sh # apache-maven and junit
#
# if using sysv
./btscrpts.sh # install bootscripts for random, iptables, dbus, httpd, mysql, networkmanager, cups and bluetooth
# if using systemd, need to do these:
# systemctl enable acpid, avahi-daemon, bluetooth, iptables, ModemManager, NetworkManager, org.cups.cupsd, squid, udisks2
