FROM debian:8.6

ENV Out=/out \
    Libs=/lib/x86_64-linux-gnu

RUN \
    # Prepare root
    mkdir -pv ${Out}/lib && \
    ln -s /lib ${Out}/lib64 && \

    mkdir -pv ${Out}/bin && \
    mkdir -pv ${Out}/usr && \
    ln -s /bin ${Out}/usr/bin && \
    
    mkdir -pv ${Out}/usr/lib/locale && \

    # Glibc
    cp ${Libs}/librt.so.1 \
       ${Libs}/libnsl.so.1 \
       ${Libs}/libm.so.6 \
       ${Libs}/ld-linux-x86-64.so.2 \
       ${Libs}/libc.so.6 \
       ${Libs}/libpthread.so.0 \
       ${Libs}/libdl.so.2 \
       ${Libs}/libnss_compat.so.2 \
       ${Libs}/libnss_dns.so.2 \
       ${Libs}/libnss_files.so.2 \
       ${Libs}/libnss_hesiod.so.2 \
       ${Libs}/libnss_nis.so.2 \
       ${Libs}/libnss_nisplus.so.2 \
       ${Libs}/libresolv.so.2 ${Out}/lib && \
    
    cp -r /usr/lib/locale/C.UTF-8 ${Out}/usr/lib/locale && \

    cd ${Out} && \
    tar czfv /rootfs.tar.gz ./*