#!/usr/bin/env bash

setfattr -x trusted.glusterfs.volume-id /data/gv0
setfattr -x trusted.gfid /data/gv0

rm -rf /data/gv0/.glusterfs

gluster volume create gv0 "${SERVER_HOSTNAME}:/data/gv0"
gluster volume start gv0
