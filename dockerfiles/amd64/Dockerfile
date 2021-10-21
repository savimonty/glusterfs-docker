FROM amd64/centos:7


WORKDIR /glusterfs-build

RUN yum makecache && \
    yum install -y openssl applydeltarpm wget unzip autoconf automake \
    bison cmockery2-devel dos2unix flex \
    fuse-devel glib2-devel libacl-devel libaio-devel libattr-devel    \
    libcurl-devel libibverbs-devel librdmacm-devel libtirpc-devel     \
    libtool libxml2-devel lvm2-devel make openssl-devel pkgconfig     \
    pyliblzma python-devel python-eventlet python-netifaces           \
    python-paste-deploy python-simplejson python-sphinx python-webob  \
    pyxattr readline-devel rpm-build sqlite-devel systemtap-sdt-devel \
    tar gperftools gperftools-devel lttng-ust

RUN mkdir urcu && \
    cd urcu && \
    wget --no-check-certificate https://lttng.org/files/urcu/userspace-rcu-0.10.0.tar.bz2 && \
    tar -jxvf userspace-rcu-0.10.0.tar.bz2 && \
    cd userspace-rcu-0.10.0 && \
    bash ./configure --prefix=/usr && \
    cat Makefile.in && \
    make && \
    make install && \
    cd ../.. && \
    rm -rf urcu

RUN mkdir src && \
    cd src && \
    wget https://github.com/gluster/glusterfs/archive/refs/heads/release-8.zip && \
    unzip release-8.zip && \
    ls -l && \
    cd glusterfs-release-8 && \
    sed -i.bak '32i/*' contrib/userspace-rcu/rculist-extra.h && \
    sed -i.bak '43i*/' contrib/userspace-rcu/rculist-extra.h && \
    rm -f contrib/userspace-rcu/rculist-extra.h.bak && \
    cat contrib/userspace-rcu/rculist-extra.h && \
    bash ./autogen.sh && \
    bash ./configure --without-libtirpc --disable-linux-io_uring && \
    make && \
    make install && \
    cd ../.. && \
    rm -rf src
    
RUN mkdir -p /glusterfs/logs

CMD ["glusterd", "-N", "--log-file=/dev/stdout"]
