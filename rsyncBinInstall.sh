#!/tools/bin/bash

set -o errexit
set -o pipefail
set -o nounset
# set -o xtrace
# Set variables for current file & dir
__dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
__file="${__dir}/$(basename "${BASH_SOURCE[0]}")"
__base="$(basename ${__file})"
echo "Dir is $__dir"
echo "full pathname is $__file"
echo "this script is $__base"
#
installPkg () {
# $1 is the package name
# $2 is the section
local package=$1
local section=$2
local PkgUserDir=/usr/src/${section}
local pkgtarfile="${package}*-x86_64.pkg.tar.xz"
local pkguserdir="/etc/pkgusr"
mkdir -pv ${PkgUserDir}/${package}
cp binaryFiles/${section}/${pkgtarfile} ${PkgUserDir}/${package}
pushd ${PkgUserDir}/${package}
# set up the links in the package user dir
  ln -s ${pkguserdir}/bash_profile .bash_profile
  ln -s ${pkguserdir}/bashrc .bashrc
  tar Jxf $pkgtarfile
  listDIRS=$(ls -l --time-style="long-iso" . | grep '^d' | awk '{print $8}')
  for eachDir in $listDIRS; do
      echo "installing files in $eachDir"
      cp -ax $eachDir /
      rm -rf $eachDir # delete the dir once installed
  done
# execute the .INSTALL file if it exists
  if [ -e .INSTALL ]; then
    echo "Executing .INSTALL for $package"
    chmod 755 .INSTALL # make sure it's executable
    ./.INSTALL
    rm .INSTALL
  fi
  touch .${package}
  rm -rf $pkgtarfile # remove the pkg tar file
popd
chown -R $package:$package ${PkgUserDir}/${package}
return 0
} # end installPkg
#
# install popt
package="popt"
section="libraries"
echo "install files for $package"
installPkg $package $section
# Install rsync
package="rsync"
section="networks"
installPkg $package $section
ldconfig
# set install directories and clean up
chown 0:0 usr
chown 0:install /etc /usr/{bin,include,lib/{,pkgconfig},share/{,locale,man}}
chown man-pages:install /usr/share/man/man{1,3,5}
chgrp install /usr/share/locale/*
chgrp install /usr/share/locale/*/LC_MESSAGES
chmod 1775 /usr/share/locale/*
chmod 1775 /usr/share/locale/*/LC_MESSAGES
chown glibc:glibc /usr/share/locale/locale.alias
chmod 644 /usr/share/locale/locale.alias
