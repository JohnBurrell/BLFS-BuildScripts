#!/bin/bash
#
./libraries.sh # pcre  pcre2 popt libusb icu libidn libatomic_ops pth npth libgpg-error libassuan libgcrypt libksba libtasn1 mtdev nspr lzo libdaemon libatasmart libunistring libidn2 liblinear apr libpng lcms2 libexif fribidi pixman gsl lcms libaio libnvme libseccomp libstatgrab apr-util jansson libxml2 libuv fftw libyaml qrencode xapian duktape inih libsass
./multimedia.sh # alsa-lib alsa-plugins alsa-utils faac faad2 libogg libvorbis lame libsndfile cdparanoia libtheora libdvdread libdvdnav libdvdcss soundtouch snd-thm-freedesktp sbc flac libsamplerate xvid libao libmad liba52 cdrdao libmpeg2 libisofs libburn libisoburn dvd-rw-tools fdkaac opus libcddb mpg123 gavl 
./server.sh # db sqlite lmdb apache
./security.sh # nettle fuse3 lvm2 parted gptfdisk mdadm dosfstools smartmontools nss cyrus-sasl p11-kit
./networks.sh # dhcpcd net-tools wget libndp libnl libmnl libnfnetlink libnftnl wireless-tools traceroute whois libtirpc rpcsvc-proto libevent bridge-utils libpcap rsync libev curl nghttp2 lynx
./security.sh # cracklib linux-pam sudo libpwquality shadow libcap iptables ca-certificates openssh gnutls liboauth
./networks.sh # wget with gnutls support, iw
./security.sh # pkcs11-helper nss-mdns
./perlmodules.sh # module-build test-mockmodule super archive-zip uri tie-ixhash xml-sax-base xml-namespace xml-sax xml-sax-expat extutils-dpnds extutls-pkgconfig parse-yapp ipc-sys-simple file-which file-basedir alien-build path-tiny file-chdir capture-tiny alien-build-plugin alien-libxml2 xml-libxml json xml-simple - completes specified packages
./programming.sh # nasm slang python2 yasm gc ruby guile gdb git php gcc-with fortran support scons sassc
./sysutils.sh # which cpio sg3_utils unzip zip minizip pciutils usbutils pm-utils acpid gpm raptor rasqal redland lm-sensors
./pst.sh # sgml-common docbook-xml docbook-xsl itstool opensp scdoc
./libraries.sh # libcap-ng libarchive speexdsp libedit libconfig hyphen ijs libunwind libssh2 ell boost exempi libedit freetype talloc wayland wayland-proto fontconfig aspell newt libcalculate libxslt glib gobject-intro json-glib glibmm enchant libxmlb libgudev appstream
./java.sh # jdk Oracle binary, apache-ant
./genutils.sh # pinentry dialog grep iso-codes mandoc bogofilter uthash bash-completion xdg-user-dirs rpmextract highlight asciidoctor gtk-doc tdb desktop-file-utils Reinstall grep with pcre support
./pst.sh # xmlto
./networks.sh # neon libpsl serf
./programming.sh # cmake doxygen cmocka ccache llvm rustc cbindgen gtest abseil-cpp
./genutils.sh # shrd-mime-info re2 tidy-html5
./libraries.sh # double-conversion giflib json-c libmypaint mypaint-brushes libjpeg-turbo libmng qpdf rapidjson libtiff benchmark (snappy) libwebp yajl openjpeg2 graphite2 muparser uchardet brotli woff2 exiv2 spidermonkey
./pythonmodules.sh # py3-alabaster py3-six py3-packaging py3-appdirs py3-ordered-set py3-pyparsing py3-python-ply py3-pytz py3-babel py3-idna py3-imagesize py3-snowballstemmer py3-toml py3-pyproject-metadata py3-pyproject_hooks py3-build py3-installer py3-chardet py3-cssselect py3-meson_python py3-lxml py3-wcwidth py3-typing_extensions py3-setuptools_scm py3-pluggy py3-pathspec py3-editables py3-hatchling py3-soupsieve py3-beautsoup py3-ptyprocess py3-docutils py3-decorator py3-pygments py3-prmpt_tlkit py3-asciidoc py3-distutils-extra py3-pexpect py3-pickleshare py3-traitlets py3-backcall py3-pure-eval py3-executing py3-asttokens py3-stack-data py3-jedi py3-ipython py3-cycler py3-dateutil py3-future py3-path py3-urllib3 py3-charset-normalizer py3-requests py3-mako py3-cython py3-pyyaml lapack py3-sip py3-pillow py3-pycryptodome py3-pybind11 py3-pyxdg py3-psautohint py3-cffsubr py3-statmake py3-ufo2ft py3-ufolib2 py3-applehelp py3-devhelp py3-htmlhelp py3-jsmath py3-qthelp py3-serializinghtml py3-sphinx py3-rdflib py3-markdown py3-codespell py3-sphinx-lv2-thme py3-certifi py3-brotli py3-gpgme
./server.sh # openldap mariadb
./icons.sh # hicolor-icon-theme icon-naming-utils
./security.sh # nftables cryptsetup gnupg krb5 libssh gpgme.
#
# install x
#
./x.sh # util-macros xbitmaps xorg-proto libxau libxdmcp xcb-proto libevdev libinput libxcb x7lib libxcvt xcb-util xcb-util-image xcb-utl-keysyms xcb-utl-rndrutl xcb-util-wm xcb-util-cursor xclock
./sysutils.sh # bubblewrap systemd dbus
./networks.sh # c-ares libproxy netctl iproute2 openvpn wpa_supplicant bind-tools squid iwd
./programming.sh # tk and reinstall python2 and 3 (for idle support) nodejs waf valgrind
./libraries.sh # keyutils libmbim libqmi libwacom dbus-glib libbytesize libblockdev jasper libraw 
./pythonmodules.sh # py3-numpy py3-dbus-python py3-dbusmock
./security.sh # polkit - leaves polkit-gnome
./xlibs.sh # libdrm gdk-pixbuf startup-notify libxklavier at-spi2-core atkmm  imlib2 graphene
./multimedia.sh # faad2 libaom frei0r-plugins libcdio speex vamp-plugin-sdk portsmf serd sord gstreamer libvpx x264 wavpack libmusicbrainz5 portaudio libgphoto2 jack2 taglib media-player-info x265 pysolfc libvdpau libva (first pass)
./x.sh # mesa x7app xcursor-themes x7font xkeyboard-config xterm xinit ttf-dejavu picom
./multimedia.sh # libva (need to ensure that libva is run after mesa installed
./xlibs.sh # cairo cairomm glu freeglut libepoxy glew
./x.sh # xorg-server xorg-evdev xorg-libinput xf86-video-amdgpu twm
#
./libraries.sh # libavif harfbuzz libgsf libxkbcommon poppler libwpe wpebackend-fdo
./xlibs.sh # pango pangomm gtk+2 gtk-engines gtk+3 gtkmm3 libglade libnotify libgedit-amtk libgedit-gtksrcvu
./genutils.sh # graphviz
./programming.sh # vala valabind - completes specified packages
./libraries.sh # libcloudproviders libical gcab umockdev libgusb libgxps gspell librsvg babl - also reinstall freetype
./icons.sh # adwaita-icon-theme - completes the packages specified in icons.sh
# you will have to add the icons for the desktop you are building. e.g. xfceicons
#
# LOG-ON TO TARGET MACHINE AND SEE IF X WORKS - do startx at the prompt
# with twm you'll get three terminals
# If you wish, you can now install openbox from the windowmanager section
