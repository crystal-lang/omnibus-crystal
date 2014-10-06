#!/bin/sh
DIR=`dirname $0`
rpm --resign $1
cp $1 $DIR/rpm
createrepo $DIR/rpm
gpg --detach-sign --armor -u 7CC06B54 $DIR/rpm/repodata/repomd.xml
