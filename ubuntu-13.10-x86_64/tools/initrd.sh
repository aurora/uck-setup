#!/usr/bin/env bash

#
# Script for modifying contents of initrd.lz, currently implemented:
#

if [ "$1" = "" ]; then
    echo "usage: $0 path-to-initrd.lz"
    exit 0
fi

if [ ! -f "$1/initrd.lz" ]; then
    echo "initrd.lz not found at '$1/initrd.lz'"
    exit 1
fi

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

mkdir /tmp/lztmp
cd /tmp/lztmp

lzma -dc -S .lz "$1/initrd.lz" | cpio -imvd --no-absolute-filenames

# TODO: process contents of 'initrd/'

echo "probably require sudo to copy-back initrd.lz"
find . | cpio --quiet --dereference -o -H newc | sudo lzma -7 > "$1/initrd.lz"

rm -rf /tmp/lztmp
