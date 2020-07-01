#!/bin/sh

set -xe

echo "see what's on /workdir"
ls -la

echo "see what's on /mnt/tf-centos-base"
ls -la /mnt/nfs-drive-1/tf-centos-base
