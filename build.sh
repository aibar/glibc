#!/bin/bash

Work=$PWD
Out=${Work}/out

sudo rm -rf ${Out}
mkdir -v ${Out}

docker run --rm -v ${Work}:/mnt debian:8.6 /mnt/steal-from-debian.sh

sudo chown -R 0 ${Out}/lib
sudo chgrp -R 0 ${Out}/lib

sudo chown 0 ${Out}/lib64
sudo chgrp 0 ${Out}/lib64

sudo chown -R 0 ${Out}/usr
sudo chgrp -R 0 ${Out}/usr

cd ${Out}
tar czfv ../fs.tar.gz ./*