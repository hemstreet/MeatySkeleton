#!/bin/bash
set -e

TOOLSDIR=${TOOLSDIR:-"$(cd `dirname $0` && pwd)"}
PROJECTROOT=${PROJECTROOT:-"${TOOLSDIR}/.."}

. $TOOLSDIR/config.sh

# Take first argument as projects, otherwise default to $PROJECTS
PROJECTS=${*-$PROJECTS}

for PROJECT in $PROJECTS; do
	echo
    echo "cleaning ${PROJECT}"
    echo
    (cd $TOOLSDIR/../$PROJECT && $MAKE clean)
    echo
done

rm -rf sysroot
rm -rf isodir
rm -rf $OSFILENAME.iso
