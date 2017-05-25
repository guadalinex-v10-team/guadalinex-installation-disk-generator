#!/bin/bash

[ $UID != 0 ] && echo "Inicialo con sudo" && exit 1

_LB_PATH=/var/gensys/live-build/guadalinexv10

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
LIVE_BUILD=${_LB_PATH} lb config 2>${_ERROR_LOG_FILE} | tee -a ${_LOG_FILE}
LIVE_BUILD=${_LB_PATH} lb build 2>${_ERROR_LOG_FILE} | tee -a ${_LOG_FILE}
#LIVE_BUILD=${_LB_PATH} lb bootstrap 2>${_ERROR_LOG_FILE} | tee -a ${_LOG_FILE}
#LIVE_BUILD=${_LB_PATH} lb chroot 2>${_ERROR_LOG_FILE} | tee -a ${_LOG_FILE}
#LIVE_BUILD=${_LB_PATH} lb binary 2>${_ERROR_LOG_FILE} | tee -a ${_LOG_FILE}
#LIVE_BUILD=${_LB_PATH} lb source 2>${_ERROR_LOG_FILE} | tee -a ${_LOG_FILE}
popd ${_ACT_PATH}

mount -o loop ${_LB_PATH}/binary.hybrid.iso /srv/guadalinex-desktop.mnt
rm -fr /srv/guadalinex-desktop
mkdir -p /srv/guadalinex-desktop
cp -a /srv/guadalinex-desktop.mnt/* /srv/guadalinex-desktop
cp -a /srv/guadalinex-desktop.mnt/.disk /srv/guadalinex-desktop/.disk
cp -a /srv/guadalinex-desktop.mnt/preseed/* /var/gensys/deb-repositories/isos/preseed-guadalinex/
umount /srv/guadalinex-desktop.mnt
