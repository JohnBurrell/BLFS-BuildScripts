#!/usr/bin/env bash

set -o errexit
set -o pipefail
set -o nounset
# set -o xtrace
# Set variables for current file & dir
__dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
if [ "$__dir" = / ]; then
  __file="${__dir}$(basename "${BASH_SOURCE[0]}")"
else
  __file="${__dir}/$(basename "${BASH_SOURCE[0]}")"
  __dir=${__dir}/ # put a / on the end, so don't add it below
fi
__base="$(basename ${__file})"
#
arg1="${1:-}"
arg2="${2:-}"
arg3="${3:-}"
echo "Dir is $__dir"
echo "file is $__file"
echo "base is $__base"
echo "arg1 is $arg1"
#echo "arg2 is $arg2"
#echo "arg3 is $arg3"
#
installFiles () {
# $1 is the package user dir - usually /usr/src/$section
# $2 is the package name to install
# $3 is the package tar file name
# $4 is the options for rsync
local pkguserdir=$1
local pkgname=$2
local pkgtarfile=$3
local rsyncopts=$4
local listDIRS
local eachDir
#
pushd ${pkguserdir}/${pkgname}
# set up the links in the package user dir
  if [ ! -L .bash_profile ]; then ln -s /etc/pkgusr/bash_profile .bash_profile; fi
  if [ ! -L .bashrc ]; then ln -s /etc/pkgusr/bashrc .bashrc; fi
  tar Jxf $pkgtarfile
  listDIRS=$(ls -l --time-style="long-iso" . | grep '^d' | awk '{print $8}')
  for eachDir in $listDIRS; do
    echo "installing files in $eachDir"
    rsync $rsyncopts $eachDir /
    rm -rf $eachDir
  done
# execute the .INSTALL file if it exists
  if [ -e .INSTALL ]; then
    echo "Executing .INSTALL for $pkgname"
    chmod 755 .INSTALL # make sure it's executable
    ./.INSTALL
    rm .INSTALL
  fi
  touch .${pkgname}
echo "remove $pkgtarfile"
  rm $pkgtarfile # remove the package tar file
  if [ "$(grep -q ^install\: /etc/group;echo $?)" = 0 ]; then # install group exists
    chown $pkgname:$pkgname .${pkgname}
  else
    echo "The install group doesn't exist. You need to create it."
    exit 1
  fi
popd
return 0
} # end installFiles
#
list_contains_item () {
# test if string $2 is in the list $1
local list="$1"
local item="$2"
if [[ $list =~ (^|[[:space:]])"$item"($|[[:space:]]) ]] ; then
  return=0 # yes
else
  return=1 # no
fi
}
#
# $1 is either root or pkguser
if [ -z $arg1 ]; then
  echo "argument should be either root or pkguser"
  echo "exit now"
  exit 1
elif [ "$arg1" != root -a "$arg1" != pkguser ]; then
  echo "argument should be either root or pkguser"
  echo "exit now"
  exit 1
else
  install_as=$1
fi
# need rsync installed to run this script
if [ ! -e /usr/bin/rsync ]; then
  echo "rsync not present."
  echo "Please install it in order to continue."
  exit 1
fi
rsyncopts="-vrlK"
[[ "$install_as" = pkguser ]] && rsyncopts="-vrlogK"
# TODO - ask location of binary Files
echo "will get bin files from ${__dir}binaryFiles"
BLFSDIRS=$(ls -l --time-style="long-iso" ${__dir}binaryFiles | grep '^d' | awk '{print $8}')
sectionorder="${__dir}installOrder/sectionOrder"
while read Section; do
  if [ "$(list_contains_item "$BLFSDIRS" "$Section"; echo $?)" = 0 ]; then
    echo "will install files for $Section"
    section=$Section
    PkgUserDir="/usr/src/${section}"
    pkgOrder="${__dir}installOrder/${section}Order"
    echo "PkgUserDir is $PkgUserDir"
    echo "Order file is $pkgOrder"
    while read package; do
# the package name and source name are different
      case $package in
         apache)
           Srcfile="httpd-"
         ;;
         apr)
           Srcfile="apr-1" # not apr-util
         ;;
         archive-zip)
           Srcfile="Archive-Zip-"
         ;;
         atk)
           Srcfile="atk-2" # not atkmm
         ;;
         cairo)
           Srcfile="cairo-1" # not cairomm
         ;;
         clutter)
           Srcfile="clutter-1" # not clutter-gst or clutter-gtk
         ;;
         cups)
           Srcfile="cups-2" # not cups-filters
         ;;
         dsktp-file-utls)
           Srcfile="desktop-file-utils-"
         ;;
         dvdrw-tools)
           Srcfile="dvd+rw-tools"
         ;;
         extutls-dpnds)
           Srcfile="ExtUtils-Depends-"
         ;;
         extutls-pkgcnfg)
           Srcfile="ExtUtils-PkgConfig"
         ;;
         geoclue)
           Srcfile="geoclue-0" # not geoclue2
         ;;
         geoclue2)
           Srcfile="geoclue-2."
         ;;
         glib)
           Srcfile="glib-" # not glibmm
         ;;
         grilo)
           Srcfile="grilo-0" # not grilo-plugins
         ;;
         gst-plgns-good)
           Srcfile="gst-plugins-good"
         ;;
         gst-plgns-base)
           Srcfile="gst-plugins-base"
         ;;
         gst-plgns-bad)
           Srcfile="gst-plugins-bad"
         ;;
         gst-plgns-ugly)
           Srcfile="gst-plugins-ugly"
         ;;
         gtkmm2)
           Srcfile="gtkmm-2"
         ;;
         gtkmm3)
           Srcfile="gtkmm-3"
         ;;
         gtkplus2)
           Srcfile="gtk+-2"
         ;;
         gtkplus3)
           Srcfile="gtk+-3"
         ;;
         hcolr-icon-thme)
           Srcfile="hicolor-icon-theme-"
         ;;
         icon-nam-utls)
           Srcfile="icon-naming-utils-"
         ;;
         imagemagick)
           Srcfile="ImageMagick-"
         ;;
         java-hamcrest)
           Srcfile="hamcrest-"
         ;;
         jdkbin)
           Srcfile="jdk-"
         ;;
         js)
           Srcfile="mozjs17"
         ;;
         js2)
           Srcfile="mozjs-"
         ;;
         lcms)
           Srcfile="lcms-" # not lcms2
         ;;
         liba52)
           Srcfile="a52dec-"
         ;;
         libsigcpp)
           Srcfile="libsigc++"
         ;;
         libtiff)
           Srcfile="tiff-"
         ;;
         libusb)
           Srcfile="libusb-1" # not libusb-compat
         ;;
         libxau)
           Srcfile="libXau-"
         ;;
         libxdmcp)
           Srcfile="libXdmcp-"
         ;;
         linux-pam)
           Srcfile="Linux-PAM-"
         ;;
         lvm2)
           Srcfile="LVM2."
         ;;
         mediaplayrinfo)
           Srcfile="media-player-info"
         ;;
         mesalib)
           Srcfile="mesa-"
         ;;
         modem-manager)
           Srcfile="ModemManager-"
         ;;
         networkmanager)
           Srcfile="NetworkManager-"
         ;;
         nss)
           Srcfile="nss-3"
         ;;
         ntificatn-demon)
           Srcfile="notification-daemon-"
         ;;
         openjdk)
           Srcfile="jdk8u"
         ;;
         opensp)
           Srcfile="OpenSP-"
         ;;
         pango)
           Srcfile="pango-1" # not pangomm or pangox-compat
         ;;
         perl-glib)
           Srcfile="Glib-"
         ;;
         portaudio)
           Srcfile="pa_stable_"
         ;;
         py2-atspi)
           Srcfile="py2-pyatspi-"
         ;;
         py2-beaker)
           Srcfile="py2-Beaker-"
         ;;
         py2-gobject3)
           Srcfile="py2-pygobject-"
         ;;
         py2-mako)
           Srcfile="py2-Mako-"
         ;;
         py2-markupsafe)
           Srcfile="py2-MarkupSafe-"
         ;;
         py2-xdg)
           Srcfile="p2-pyxdg-"
         ;;
         py3-atspi)
           Srcfile="py3-pyatspi-"
         ;;
         py3-beaker)
           Srcfile="py3-Beaker-"
         ;;
         py3cairo)
           Srcfile="py3-pycairo-"
         ;;
         py3-gobject3)
           Srcfile="py3-pygobject-"
         ;;
         py3-mako)
           Srcfile="py3-Mako-"
         ;;
         py3-markupsafe)
           Srcfile="py3-MarkupSafe-"
         ;;
         py3-xdg)
           Srcfile="py3-pyxdg-"
         ;;
         pygobject2)
           Srcfile="pygobject-"
         ;;
         pysolfc)
           Srcfile="PySolFC-"
         ;;
         pysolss)
           Srcfile="pysol-sound-server-"
         ;;
         python2)
           Srcfile="Python-2."
         ;;
         python3)
           Srcfile="Python-3."
         ;;
         qt4)
           Srcfile="qt-"
         ;;
         sdl)
           Srcfile="SDL-"
         ;;
         shrd-mime-info)
           Srcfile="shared-mime-info-"
         ;;
         s-lang)
           Srcfile="slang-"
         ;;
         speechd)
           Srcfile="speech-dispatcher"
         ;;
         startup-notify)
           Srcfile="startup-notification-"
         ;;
         telepathy-gabl)
           Srcfile="telepathy-gabble-"
         ;;
         telepathy-logr)
           Srcfile="telepathy-logger-"
         ;;
         tlpthy-frstream)
           Srcfile="telepathy-farstream-"
         ;;
         tpthymisscntrl)
           Srcfile="telepathy-mission-control-"
         ;;
         tie-ixhash)
           Srcfile="Tie-IxHash-"
         ;;
         uri)
           Srcfile="URI-"
         ;;
         webkitgtk)
           Srcfile="webkitgtk-2.4"
         ;;
         webkit2gtk)
           Srcfile="webkitgtk-2.8"
         ;;
         x264)
           Srcfile="last_stable_x264"
         ;;
         xcb-util)
           Srcfile="xcb-util-0" # not xcb-util-image,keysyms,renderutil or wm
         ;;
         xcb-utl-keysyms)
           Srcfile="xcb-util-keysyms-"
         ;;
         xcb-utl-rndrutl)
           Srcfile="xcb-util-renderutil-"
         ;;
         xml-libxml)
           Srcfile="XML-LibXML-"
         ;;
         xml-namespace)
           Srcfile="XML-NamespaceSupport-"
         ;;
         xml-sax)
           Srcfile="XML-SAX-0" # not XML-SAX-Base, nor XML-SAX-Expat
         ;;
         xml-sax-base)
           Srcfile="XML-SAX-Base-"
         ;;
         xml-sax-expat)
           Srcfile="XML-SAX-Expat-"
         ;;
         xml-simple)
           Srcfile="XML-Simple-"
         ;;
         xorg-evdev)
           Srcfile="xf86-input-evdev-"
         ;;
         xorg-intel)
           Srcfile="xf86-video-intel-"
         ;;
         xorg-synaptics)
           Srcfile="xf86-input-synaptics-"
         ;;
         xorg-vmmouse)
           Srcfile="xf86-input-vmmouse-"
         ;;
         xorg-wacom)
           Srcfile="xf86-input-wacom-"
         ;;
         *)
           Srcfile=$package
         ;;
      esac
      echo "install files for $package"
      pkgtarfile="${Srcfile}*-x86_64.pkg.tar.xz"
# package already installed?
      if [ -e ${PkgUserDir}/${package}/.${package} ]; then
        echo "package $package already installed"
      elif [ ! -e binaryFiles/${section}/${pkgtarfile} ]; then
        echo "No file binaryFiles/${section}/${pkgtarfile} found"
        echo "You need to create it"
      else
        case $package in
           dbus|libcap|shadow|systemd) # installed by LFS so section is core
# the pkg file and .$package-destdir file may already exist so delete them
              rm -rf /usr/src/core/${package}/{etc,usr,var,${package}*-x86_64.pkg.tar.xz,.${package}-destdir}
# changed section so test if already installed
              if [ -e /usr/src/core/${package}/.${package} ]; then
                echo "package $package already installed"
              else
                cp binaryFiles/${section}/${pkgtarfile} /usr/src/core/${package}
                if [ "$(grep -q ^$package\: /etc/passwd;echo $?)" != 0 ]; then
                  echo "*** Something wrong here ***"
                  echo "$package should already be in /etc/passwd"
                  echo "You need to investigate why it isn't"
                  exit 1
                fi
                installFiles "/usr/src/core" $package $pkgtarfile $rsyncopts
                if [ "$(grep -q ^install\: /etc/group;echo $?)" = 0 ]; then # install group exists
                  chown -R $package:$package /usr/src/core/${package}
                fi
              fi
           ;;
           *)
              mkdir -pv ${PkgUserDir}/${package}
              cp binaryFiles/${section}/${pkgtarfile} ${PkgUserDir}/${package}
              if [ "$(grep -q ^$package\: /etc/passwd;echo $?)" != 0 ]; then
                installpkg $package $section
              fi
              installFiles $PkgUserDir $package $pkgtarfile $rsyncopts
              if [ "$(grep -q ^install\: /etc/group;echo $?)" = 0 ]; then # install group exists
                chown -R $package:$package ${PkgUserDir}/${package}
              fi
           ;;
        esac
      fi
    done < $pkgOrder
  else
    echo "$Section not present in ${__dir}binaryFiles"
    echo "Create the binaries to install then for this section"
  fi
done < $sectionorder
#
# change owner and permissions
if [ "$install_as" = pkguser ]; then
  chown -h root:root /usr /lib /var/run
  chown root:install /etc /var/{,cache,lib,log}
  chown root:install /usr/{bin,include,lib/{,pkgconfig},share/{,aclocal,doc,info,locale,man,pkgconfig,terminfo,zoneinfo}}
  chgrp install /usr/lib/{cmake,girepository-1.0,python2.7,python3.4,udev/{hwdb.d,rules.d}}
  chgrp install /usr/{share/{devhelp/books,gir-1.0,gtk-doc,icons/hicolor/22x22,info/dir,vala/{,vapi}},include/dbus-1.0/dbus}
  if [ -d /usr/share/help ]; then
    chgrp install /usr/share/help/* # installed by rarian
    chmod 1775 /usr/share/help/*
    chown rarian:rarian /usr/share/help/rarian.document
    chmod 644 /usr/share/help/rarian.document
  fi
  chmod 1775 /usr/{lib/{,cmake,gio/modules,girepository-1.0,pkgconfig,python2.7,python3.4,udev/hwdb.d},share/{common-lisp/source,devhelp/books,gir-1.0,gtk-doc,icons/hicolor/22x22,pkgconfig,thumbnailers,vala/{,vapi},xml}}
  chmod 1775 /usr/include/apr-1
  chmod 664 /usr/share/info/dir
  secDir="/usr/share/locale"
  allLocaleDirs=$(ls -l --time-style="long-iso" $secDir | egrep '^d' | awk '{print $8}')
  for dirs in $allLocaleDirs; do
    chgrp install ${secDir}/${dirs}
    chmod 1775 ${secDir}/${dirs}
    LC_dir="${secDir}/${dirs}/LC_MESSAGES"
    chgrp install $LC_dir
    chmod 1775 $LC_dir
  done
fi
