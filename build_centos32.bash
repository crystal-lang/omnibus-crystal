#!/bin/bash -e
rvmsudo bash -c "scl enable devtoolset-1.1 \"bash -c \\\"cd /vagrant && bundle && CRYSTAL_RELEASE_VERSION=${1} bundle exec omnibus build crystal\\\"\""
rvmsudo bash -c "cd /vagrant && ./dist/add-rpm.sh pkg/crystal-${1}-1.i686.rpm"
