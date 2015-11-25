#!/bin/bash

[ $UID != 0 ] && echo "Inicialo con sudo" && exit 1

_LB_PATH=/var/gensys/live-build/gecosv2-14.04

_ACT_PATH=$(pwd)

_BUILD_DATE=$(date +%Y%m%d-%H%M)
_LOG_FILE="$_LB_PATH/log/lb_build-$_BUILD_DATE.log"
_ERROR_LOG_FILE="$_LB_PATH/log/lb_build-$_BUILD_DATE.error.log"
test -h $_LB_PATH/log/lb_build.log && rm $_LB_PATH/log/lb_build.log
ln -s $_LOG_FILE $_LB_PATH/log/lb_build.log
test -h $_LB_PATH/log/lb_build.error.log && rm $_LB_PATH/log/lb_build.error.log
ln -s $_ERROR_LOG_FILE $_LB_PATH/log/lb_build.error.log


pushd ${_LB_PATH}
LIVE_BUILD=${_LB_PATH} lb clean 2>${_ERROR_LOG_FILE} | tee -a ${_LOG_FILE}
LIVE_BUILD=${_LB_PATH} lb build 2>${_ERROR_LOG_FILE} | tee -a ${_LOG_FILE}
popd ${_ACT_PATH}

mount -o loop ${_LB_PATH}/binary.hybrid.iso /srv/gecos-desktop.mnt
rm -fr /srv/gecos-desktop
mkdir -p /srv/gecos-desktop
cp -a /srv/gecos-desktop.mnt/* /srv/gecos-desktop
cp -a /srv/gecos-desktop.mnt/.disk /srv/gecos-desktop/.disk
cp -a /srv/gecos-desktop.mnt/preseed/* /var/gensys/deb-repositories/isos/preseed-gecos/
umount /srv/gecos-desktop.mnt
