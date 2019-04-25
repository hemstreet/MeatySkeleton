#!/bin/sh
set -e

TOOLSDIR=${TOOLSDIR:-"$(cd `dirname $0` && pwd)"}
PROJECTROOT=${PROJECTROOT:-"${TOOLSDIR}/.."}

. $TOOLSDIR/headers.sh

PROJECTS=${1-$PROJECTS}

echo $PROJECTROOT
for PROJECT in $PROJECTS; do
  (cd $PROJECTROOT/$PROJECT && DESTDIR="$SYSROOT" $MAKE install)
done
