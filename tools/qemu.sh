#!/bin/sh
set -e

TOOLSDIR=${TOOLSDIR:-"$(cd `dirname $0` && pwd)"}
PROJECTROOT=${PROJECTROOT:-"${TOOLSDIR}/.."}

. $TOOLSDIR/iso.sh

qemu-system$($TOOLSDIR/target-triplet-to-arch.sh $HOST) -cdrom $OSFILENAME.iso
