#!/bin/bash

tmpdir=$( mktemp -d )
trap "echo removing ${tmpdir}; rm -rf ${tmpdir}" EXIT

MIRROR_URL="http://ftp.iij.ad.jp/pub/linux/centos/6.5/os/x86_64"
MIRROR_URL_UPDATES="http://ftp.iij.ad.jp/pub/linux/centos/6.5/updates/x86_64"

yum install -y febootstrap xz

febootstrap \
  -i centos-release \
  -i yum \
  -i tar \
  -i iproute \
  centos ${tmpdir} $MIRROR_URL -u $MIRROR_URL_UPDATES

febootstrap-run ${tmpdir} -- bash -c 'echo "NETWORKING=yes" > /etc/sysconfig/network'
febootstrap-run ${tmpdir} -- bash -c 'echo "HOSTNAME=localhost.localdomain" >> /etc/sysconfig/network'
febootstrap-run ${tmpdir} -- bash -c 'touch /etc/resolv.conf'
febootstrap-run ${tmpdir} -- bash -c 'touch /sbin/init'
febootstrap-run ${tmpdir} -- bash -c 'ln -sf /bin/true /sbin/initctl'
febootstrap-run ${tmpdir} -- bash -c 'yum clean all'
febootstrap-run ${tmpdir} -- bash -c 'rm -rf /usr/{{lib,share}/locale,{lib,lib64}/gconv,bin/localedef,sbin/build-locale-archive}'
febootstrap-run ${tmpdir} -- bash -c 'rm -rf /usr/share/{man,doc,info,gnome/help}'
febootstrap-run ${tmpdir} -- bash -c 'rm -rf /usr/share/cracklib'
febootstrap-run ${tmpdir} -- bash -c 'rm -rf /usr/share/i18n'
febootstrap-run ${tmpdir} -- bash -c 'rm -rf /sbin/sln'
febootstrap-run ${tmpdir} -- bash -c 'rm -rf /etc/ld.so.cache'
febootstrap-run ${tmpdir} -- bash -c 'rm -rf /var/cache/ldconfig/*'
febootstrap-run ${tmpdir} -- tar -cf - . | xz > centos65.tar.xz
