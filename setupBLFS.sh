#!/bin/bash

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
export LFS=/mnt/lfs
# copy the dir containing all the binary pkg files
# assume they are in binaryFiles
# TODO - ask for this dir
if [ -d ${__dir}/binaryFiles ]; then
  cp -r ${__dir}/binaryFiles $LFS
else
  echo "Can't find the binary files."
  echo "They should be in ${__dir}/binaryFiles"
  exit 1
fi
# copy the script to continue the installation
cp ${__dir}/installBLFS.sh $LFS
# cp the order files
cp -r ${__dir}/installOrder $LFS
