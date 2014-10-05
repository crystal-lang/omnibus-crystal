#!/bin/sh
DIR=`dirname $0`
s3cmd -c ~/.s3cfg-crystal sync --delete-removed -P $DIR/apt/ s3://dist.crystal-lang.org/apt/
