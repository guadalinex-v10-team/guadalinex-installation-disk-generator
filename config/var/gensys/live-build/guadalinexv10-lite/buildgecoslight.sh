#!/bin/bash

[ $UID != 0 ] && echo "Inicialo con sudo" && exit 1

_LB_PATH=/var/gensys/live-build/gecosv2-light

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

mount -o loop ${_LB_PATH}/binary.hybrid.iso /srv/gecos-light.mnt
cp -a /srv/gecos-light.mnt/* /srv/gecos-light
cp -a /srv/gecos-desktop.mnt/preseed/* /var/gensys/deb-repositories/isos/preseed-gecos/
umount /srv/gecos-light.mnt
