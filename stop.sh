#!/usr/bin/env bash

ARCH=$(arch)
if [[ "${ARCH}" == "x86_64" ]]; then
    export CENTOS_ARCH="amd64"
elif [[ "${ARCH}" == "aarch64" ]]; then
    export CENTOS_ARCH="arm64v8"
fi

docker-compose down
