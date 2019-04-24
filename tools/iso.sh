#!/bin/sh
set -e

# change scripts working directory so we can have a known path
TOOLDIR="$(dirname "${0}")"

. $TOOLDIR/build.sh

cd $PROJECTROOT

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
