#!/usr/bin/env bash

setfattr -x trusted.glusterfs.volume-id "/data/${VOLNAME}"
setfattr -x trusted.gfid "/data/${VOLNAME}"

rm -rf "/data/${VOLNAME}/.glusterfs"

gluster volume create "${VOLNAME}" "${SERVER_HOSTNAME}:/data/gv0"
gluster volume start "${VOLNAME}"
