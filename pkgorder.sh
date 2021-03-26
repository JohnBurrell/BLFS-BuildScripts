#!/bin/bash
#
# The rationale is to get x installed reasonably early, but
# other considerations are that python needs tk to use IDLE
# tk needs x libraries and xcb-proto needs python installed.
# the solution here is to install python2 early (python3 is now in LFS)
# Once x libraries are installed, then install tk and then reinstall python2 and 3 for IDLE.
# ** NOTE ** do not move the position of tk - it has to come before python2 in order
# that python2 and 3 are reinstalled after tk is installed.
# 
# wget is reinstalled after gnutls is installed.
./libraries.sh # libs with no dependencies - installs to libuv
./multimedia.sh # alsa and basic sound libraries - installs to mpg123
./server.sh # db, sqlite, and apache. Next is openldap which needs cyrus-sasl
./security.sh # nettle, cracklib, linux-pam, shadow, libcap, fuse3, sudo, lvm2, parted, gptfdisk, mdadm, dosfstools, libpwquality, nss, cyrus-sasl, p11-kit
./networks.sh # dhcpcd, net-tools, wget, libndp, libnl, libmnl, libnftnl, wireless-tools, traceroute, whois, libtirpc, rpcsvc-proto, libevent, bridge-utils, libpcap, nmap, rsync, libev, curl, nghttp2, lynx
./security.sh # nftables, ca-certs, openssh, gnutls, liboauth
./networks.sh # wget with gnutls support, iw, neon
./security.sh # pkcs11-helper and nss-mdns
./perlmodules.sh # module-build, test-mockmodule, super, archive-zip, uri, tie-ixhash, xml-sax-base, xml-namespace, xml-sax, xml-sax-expat, extutils-dpnds, extutls-pkgcnfg, parse-yapp, ipc-sys-simple, file-which, file-basedir, alien-build, path-tiny, file-chdir, capture-tiny, alien-libxml2, xml-libxml, xml-simple - completes specified packages
./programming.sh # nasm, slang, python2, scons gc ruby guile  gdb, git, php, resinstall gcc for fortran support
./sysutils.sh # which, cpio, sg3_utils, unzip, zip, minizip, pciutils, usbutils, pm-utils, acpid, gpm, raptor, rasqal, redland, bubblewrap
./pst.sh # sgml-common, docbook-xml, docbook-xsl, itstool, opensp
./libraries.sh # hyphen, ijs, libunwind, libsass, libssh2, boost, exempi, libedit, freetype, talloc, wayland, wayland-proto, libarchive, fontconfig, aspell, newt, libxslt, glib, gobject-intro, json-glib, glibmm, enchant, libgudev
./java.sh # Oracle binary (15.0.2), apache-ant
./genutils.sh # pinentry, dialog, grep, iso-codes, bogofilter, bash-completion, re2, graphviz, rpmextract, highlight, asciidoc, rarian, gtk-doc, tdb, desktop-file-utils. Reinstall grep with pcre support
./pst.sh # xmlto
./networks.sh # libpsl, serf
./programming.sh # cmake, doxygen, cmocka, ccache, sassc, llvm, subversion, rustc, cbindgen, vala
./libraries.sh # giflib, json-c, libmypaint, mypaint-brushes, yaml, exiv2, libjpeg-turbo, libmng, qpdf, rapidjson, libtiff, snappy, libwebp, yajl, openjpeg2, libical, gcab, graphite2
./server.sh # openldap and mariadb - completes specified packages
./icons.sh # hicolor-icon-theme, icon-naming-utils and adwaita-icon-theme
./security.sh # cryptsetup, gnupg, krb5, gpgme and volume_key. Leaves polkit
./pythonmodbin.sh # install binaries for py2-ordered-set, py2-pyparsing, py2-setuptools
./pythonmodules.sh # py2-cssselect to pybind11
#
# install x
#
./x.sh # util-macros, xbitmaps, xorg-proto, libxau, libxdmcp, xcb-proto, libevdev, libinput, libxcb, x7lib, xcb-util, xcb-util-image, xcb-utl-keysyms, xcb-utl-rndrutl, xcb-util-wm, xcb-util-cursor, xclock, libvdpau
./genutils.sh # shared-mime-info, tidy, brotli and woff2 - leaves imagemagick and ibus
./sysutils.sh # systemd with gudev, dbus, bluez
./networks.sh # c-ares, libproxy, netctl, iproute2, openvpn, wpa_supplicant, bind-tools, squid
./programming.sh # tk and reinstall python2 and 3 for idle support. nodejs, waf, valgrind
./libraries.sh # libmbim, libqmi, libwacom, libgusb, js78, dbus-glib, libbytesize, libblockdev, jasper
./security.sh # polkit - completes specified packages
./pythonmodules.sh # py3-numpy, py3-scipy, py3-xdg, py3-dbus, py3-dbusmock
./xlibs.sh # libdrm, atk, atkmm, gdk-pixbuf, startup-notify, libxklavier, at-spi2, imlib2, graphene
./multimedia.sh # celt, libcdio, speex, vamp-plugin-sdk, portsmf, serd, sord, gstreamer, libvpx, x264, wavpack, libmusicbrainz, portaudio, libgphoto2, jack2, taglib, media-player-info, x265, pulseaudio, espeak, speechd, smpeg, pysolfc
./x.sh # libva, mesa, x7app, xcursor-themes, x7font, xkeyboard-config, xterm, xinit, dejavu-fonts
./xlibs.sh # cairo, cairomm, glu, freeglut, libepoxy
./x.sh # xorg-server, xorg-evdev, xorg-libinput, xorg-amdgpu, twm
#
./libraries.sh # harfbuzz, libgsf, libxkbcommon and poppler
./xlibs.sh # pango, pangomm, cogl, gtk+2, gtk+3, libnotify, gtk-vnc, clutter clutter-gtk, libdazzle, tepl
./libraries.sh # libgxps, gspell, librsvg and babl. Also reinstall freetype for harfbuzz support
./sysutils.sh # accountsservice, colord, modemmanager, udisks, upower
./multimedia.sh # lv2, sratom, lilv, sdl2, gstreamer plugins, libass, libcanberra, ffmpeg, gst-libav, pavucontrol
./pythonmodules.sh # py3-cairo, py3-gobject, py3-matplotlib, py3-atspi. py2 modules no longer installed
./programming.sh # sysprof - leaves codelite and cuda
./pst.sh # mupdf
./xsoftware.sh #  xdg-utils
./pst.sh # cups, ghostscript
./gnomeplatform.sh # gnome-common, gset-dsktp-schms, libsecret, yelp-xsl, telp-tools, gnome-menus, libgee, libgtop, gexiv2, gjs, dconf, vte, gconf, gcr, gnome-autoar, gnome-desktop, libwnck, libpeas
./networks.sh # glib-networking, libsoup, uhttpmock, samba, networkmanager, libnma, network-manager-applet
./libraries.sh # gegl, libgrss, and appstream-glib - completes specified packages
./xsoftware.sh # gimp 
./icons.sh # gnome-icon-theme, extras, symbolic and gnome-themes-extra - completes specified packages
# for gnome and openelec
./telepathy.sh # telepathy-glib, telepathy-logger, mission-control - completes specified packages
# for xfce
./xfcegnomeplatform.sh # if using xfce, gnomeplatform packages for xfce
#
# if installing kodi then
./openelec.sh # p8-platform, glew, setconf, tinyxml, libmodplug, libcec, libaacs, libmicrohttpd
#
./java.sh # openjdk
./multimedia.sh # gst-plugins-good
./genutils.sh # ImageMagick and ibus - completes specified packages
./gnomeplatform.sh # gssdp, gupnp, gupnp-igd, totem-pl-parser, geocode-glib, grilo, grilo-plugin, libchamplain, libgweather, librest, tracker, tracker-miners, tracker3,  tracker3-miners
#
./networks.sh # libnice
./xlibs.sh # colord-gtk, clutter-gst, qt5-base, qt5-svg, qt5-x11extras
./networks.sh # avahi, geoclue - completes specified packages 
./xlibs.sh # webkit2gtk and wxtgk - completes specified packages
./gnomeplatform.sh # goa, libgdata, evol-data-server, folks - completes specified packages
#
# for xfce
./xfcegnomedesktop.sh # gnomedesktop packages for xfce
./xfce.sh
#
# for openelec (if using a window manager other than gnome)
./windowmanager.sh # fluxbox, openbox, i3-wm and menumaker - completes specified packages
#
# for gnome and openelec
./multimedia.sh # v4l-utils, pipewire, farstream, vlc - completes specified packages
./gnomedesktop.sh # gnome-backgrounds, gnome-video-effects, gvfs, nautilus, zenity, gnome-keyring, gnome-settings-daemon, mutter, gnome-shell-extensions, gnome-session, gdm, gnome-user-docs, catarell-fonts, yelp, gsound, gnome-bluetooth, gnome-shell
# for gnome
./gnomeapps.sh # baobab, cheese, gnome-calculator, gnome-color-manager, gnome-dictionary, gnome-nettool, gnome-power-manager, gucharmap, aisleriot, xboard, gnuchess, gnome-chess, gnome-disk-utility, brasero, eog, gedit, evince, gnome-clocks, gnome-system-monitor, gnome-terminal, gnome-user-share, seahorse, gnome-screenshot, gnome-tweaks - completes specified packages
./gnomedesktop.sh # gnome-control-center -completes specified packages
#
./pst.sh # cups-filters, gutenprint, sane and xsane - completes specified packages
./sysutils.sh # notification-daemon, weston
#
# ******************************************************************
# *** install the following on the target machine, not in chroot ***
# ******************************************************************
#
# for openelec
./openelec.sh # kodi and the encoders - completes specified packages
#
./programming.sh # codelite and cuda - completes specified packages
./browser.sh # firefox and chromium
./xsoftware.sh # inkscape and icedtea-web - completes specified packages 
./nvidia.sh # nvidia modules - needed if using CUDA
./java.sh # apache-maven and junit
#
# if using sysv
./btscrpts.sh # install bootscripts for random, dbus, httpd, mysql, networkmanager, cups and bluetooth
# if using systemd, need to do these:
systemctl enable acpid.service avahi-daemon.service bluetooth.service nftables.service ModemManager.service NetworkManager.service org.cups.cupsd.service udisks2.service
# note - wpa_supplicant.service and dhcpcd.service will start at boot time
