#!/bin/sh
set -e

cd "$(dirname "$0")"

. ./headers.sh

PROJECTS=${1-$PROJECTS}

for PROJECT in $PROJECTS; do
  (cd $PROJECTROOT/$PROJECT && DESTDIR="$SYSROOT" $MAKE install)
done
