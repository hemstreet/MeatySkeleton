#!/bin/sh
set -e

TOOLSDIR=${TOOLSDIR:-"$(cd `dirname $0` && pwd)"}
PROJECTROOT=${PROJECTROOT:-"${TOOLSDIR}/.."}

# change scripts working directory so we can have a known path

. $TOOLSDIR/build.sh

cd $PROJECTROOT

# make these in the context to our project root dir
mkdir -p isodir
mkdir -p isodir/boot
mkdir isodir/boot/grub

cp sysroot/boot/$OSFILENAME.kernel isodir/boot/myos.kernel
cat > isodir/boot/grub/grub.cfg << EOF
menuentry "myos" {
	multiboot /boot/myos.kernel
}
EOF

grub-mkrescue -o $OSFILENAME.iso isodir
