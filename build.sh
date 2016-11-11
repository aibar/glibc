#!/bin/bash

docker build --rm \
       -f Dockerfile-builder \
       -t glibc-builder .

docker run --rm -it \
       -v $PWD:/mnt \
       glibc-builder \
       cp /rootfs.tar.gz /mnt