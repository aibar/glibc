#!/bin/bash

function catFromDebian {
    docker run --rm --entrypoint cat debian:8.6 $1
}

sudo rm -rf out && mkdir -v out
cd out

mkdir -v lib
ln -s /lib lib64

Libs=/lib/x86_64-linux-gnu

catFromDebian ${Libs}/librt.so.1 > lib/librt.so.1
catFromDebian ${Libs}/libnsl.so.1 > lib/libnsl.so.1
catFromDebian ${Libs}/libm.so.6 > lib/libm.so.6
catFromDebian ${Libs}/ld-linux-x86-64.so.2 > lib/ld-linux-x86-64.so.2
catFromDebian ${Libs}/libc.so.6 > lib/libc.so.6
catFromDebian ${Libs}/libpthread.so.0 > lib/libpthread.so.0
catFromDebian ${Libs}/libdl.so.2 > lib/libdl.so.2

catFromDebian ${Libs}/libnss_compat.so.2 > lib/libnss_compat.so.2
catFromDebian ${Libs}/libnss_dns.so.2 > lib/libnss_dns.so.2
catFromDebian ${Libs}/libnss_files.so.2 > lib/libnss_files.so.2
catFromDebian ${Libs}/libnss_hesiod.so.2 > lib/libnss_hesiod.so.2
catFromDebian ${Libs}/libnss_nis.so.2 > lib/libnss_nis.so.2
catFromDebian ${Libs}/libnss_nisplus.so.2 > lib/libnss_nisplus.so.2
catFromDebian ${Libs}/libresolv.so.2 > lib/libresolv.so.2

chmod +x lib/*
sudo chown -R 0 lib lib64
sudo chgrp -R 0 lib lib64

tar czfv ../fs.tar.gz ./*
