#!/usr/bin/env bash

set -x

glusterd -N &

sleep 5

setfattr -x trusted.glusterfs.volume-id /data/gv0
setfattr -x trusted.gfid /data/gv0

rm -rf /data/gv0/.glusterfs

gluster volume create gv0 glusterfs:/data/gv0
gluster volume start gv0
