# Glusterfs 8 recipe to build container for amd64 and arm64v8

Modify the docker-compose.yml as per your needs.

## How to run
```
$ ./run.sh
```
This will build a docker image if it does not already exist. The image will build userspace-rcu and glusterfs from source.
The script will determine the current architecture and pull base centos images accordingly.

Once built, a container will run.

## How to stop
```
$ ./stop.sh
```
This will stop a running container.

## Configuration
Coming soon ... 

## Some conflicts being handled while building sources in the Dockerfiles
Userspace-rcu and Gluster have competing versions for a file rculist-extra.h
https://github.com/gluster/glusterfs/issues/1121#issue-582755169
