#!/bin/sh
DIR=`dirname $0`

gpg --export --armor 7CC06B54 > $DIR/rpm/RPM-GPG-KEY
cp $DIR/rpm-setup.sh $DIR/rpm/setup.sh
cp $DIR/apt-setup.sh $DIR/apt/setup.sh

s3cmd -c ~/.s3cfg-crystal sync --delete-removed -P $DIR/apt/ s3://dist.crystal-lang.org/apt/
s3cmd -c ~/.s3cfg-crystal sync --delete-removed -P $DIR/rpm/ s3://dist.crystal-lang.org/rpm/
