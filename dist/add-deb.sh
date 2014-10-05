#!/bin/sh
DIR=`dirname $0`
dpkg-sig --sign builder -m 7CC06B54 $1
reprepro --ask-passphrase -V --confdir $DIR/apt-conf --basedir $DIR/apt includedeb crystal $1
