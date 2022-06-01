#!/bin/bash
#
./libraries.sh # pcre  pcre2 popt libusb icu libidn libatomic_ops pth npth libgpg-error libassuan libtasn1 mtdev nspr lzo libdaemon libatasmart libunistring libidn2 liblinear apr libpng lcms2 libexif fribidi pixman gsl lcms libaio libseccomp libstatgrab apr-util jansson libxml2 libuv fftw libyaml qrencode xapian
./multimedia.sh # alsa-lib alsa-plugins alsa-utils faac faad2 libogg libvorbis lame libdiscid libsndfile cdparanoia libtheora libdvdcss soundtouch sbc flac libsamplerate xvid libao libisofs libburn libisoburn dvd-rw-tools fdkaac opus libcddb mpg123 gavl 
./server.sh # db sqlite lmdb apache
./security.sh # nettle cracklib linux-pam shadow libcap fuse3 sudo lvm2 parted gptfdisk mdadm dosfstools libpwquality nss cyrus-sasl p11-kit smartmontools
./networks.sh # dhcpcd net-tools wget libndp libnl libmnl libnftnl wireless-tools traceroute whois libtirpc rpcsvc-proto libevent bridge-utils libpcap nmap rsync libev curl nghttp2 lynx
./security.sh # iptables ca-certs openssh gnutls liboauth
./networks.sh # wget with gnutls support, iw
./security.sh # pkcs11-helper nss-mdns
./perlmodules.sh # module-build test-mockmodule super archive-zip uri tie-ixhash xml-sax-base xml-namespace xml-sax xml-sax-expat extutils-dpnds extutls-pkgcnfg parse-yapp ipc-sys-simple file-which file-basedir alien-build path-tiny file-chdir capture-tiny alien-libxml2 xml-libxml json xml-simple - completes specified packages
./programming.sh # nasm slang python2 gc ruby guile gdb git php gcc (fortran support} scons sassc
./sysutils.sh # which cpio sg3_utils unzip zip minizip pciutils usbutils pm-utils acpid gpm raptor rasqal redland bubblewrap lm-sensors
./pst.sh # sgml-common docbook-xml docbook-xsl itstool opensp
./libraries.sh # libedit libconfig hyphen ijs libunwind libssh2 boost exempi libedit freetype talloc wayland wayland-proto libarchive fontconfig aspell newt libcalculate libxslt glib gobject-intro json-glib glibmm enchant libgudev
./java.sh # jdk Oracle binary, apache-ant
./genutils.sh # pinentry dialog grep iso-codes bogofilter bash-completion re2 rpmextract highlight asciidoctor gtk-doc tdb desktop-file-utils Reinstall grep with pcre support
./pst.sh # xmlto
./networks.sh # neon libpsl serf
./programming.sh # cmake doxygen cmocka ccache llvm subversion rustc cbindgen gtest
./libraries.sh # giflib json-c libmypaint mypaint-brushes yaml exiv2 libjpeg-turbo libmng qpdf rapidjson libtiff benchmark snappy libwebp yajl openjpeg2 graphite2 muparser
./server.sh # openldap mariadb
./icons.sh # hicolor-icon-theme icon-naming-utils adwaita-icon-theme # icons independent of desktop
./security.sh # nftables cryptsetup gnupg krb5 libssh gpgme volume_key.
./pythonmodules.sh # py3-six py3-packaging py3-appdirs py3-ordered-set py3-pyparsing py3-python-ply py3-pytz py3-idna py3-chardet py3-cssselect py3-lxml py3-wcwidth py3-soupsieve py3-beautsoup py3-ptyprocess py3-docutils py3-decorator py3-pygments py3-prmpt_tlkit py3-asciidoc py3-pexpect py3-pickleshare py3-traitlets py3-backcall py3-ipython py3-cycler py3-setuptools_scm py3-dateutil py3-future py3-path py3-urllib3 py3-requests py3-beaker py3-markupsafe py3-mako py3-pyyaml py3-cython lapack py3-sip py3-pillow py3-pycryptodome py3-pybind11 py3-pyxdg py3-psautohint py3-cffsubr py3-statmake py3-ufo2ft py3-ufolib2 py3-flit-core py3-brotli py3-build py3-installer
#
# install x
#
./x.sh # util-macros xbitmaps xorg-proto libxau libxdmcp xcb-proto libevdev libinput libxcb x7lib libxcvt xcb-util xcb-util-image xcb-utl-keysyms xcb-utl-rndrutl xcb-util-wm xcb-util-cursor xclock libvdpau
./genutils.sh # shared-mime-info tidy-html5 brotli woff2
./sysutils.sh # systemd dbus
./networks.sh # c-ares libproxy netctl iproute2 openvpn wpa_supplicant bind-tools NOTE cannot install squid because it's not compatible with openssl-3.x
./programming.sh # tk and reinstall python2 and 3 for idle support. nodejs, waf
./libraries.sh # ell libmbim libqmi libwacom js91 dbus-glib libbytesize libblockdev jasper libraw 
./pythonmodules.sh # py3-numpy py3-dbus py3-dbusmock
./security.sh # polkit - leaves polkit-gnome
./xlibs.sh # libdrm atk atkmm gdk-pixbuf startup-notify libxklavier at-spi2 imlib2 graphene
./multimedia.sh # frei0r-plugins celt libcdio speex vamp-plugin-sdk portsmf serd sord gstreamer libvpx x264 wavpack libmusicbrainz5 portaudio libgphoto2 jack2 taglib media-player-info x265 pulseaudio espeak sdl smpeg pysolfc
./x.sh # libva mesa x7app xcursor-themes x7font xkeyboard-config xterm xinit dejavu-fonts
./xlibs.sh # cairo cairomm glu freeglut libepoxy
./x.sh # xwayland xorg-server xorg-evdev xorg-libinput xorg-amdgpu
# **NOTE** x.sh will also install twm unless you have chosen an LxQt or Xfce desktop. In this case
# x.sh will install openbox - see below
#
./libraries.sh # harfbuzz libgsf libxkbcommon poppler libwpe wpebackend-fdo
./xlibs.sh # pango pangomm cogl gtk+2 gtk-engines gtkmm2 gtk+3 gtkmm3 libglade libnotify clutter clutter-gtk
./genutils.sh # graphviz
./programming.sh # vala
#
./x.sh # openbox
#
# LOG-ON TO TARGET MACHINE AND SEE IF X WORKS - do startx at the prompt
# if using twm, you'll get three screens
# if using openbox, you'll get a blank screen. Do right mouse button, terminal and xterm to get a terminal
