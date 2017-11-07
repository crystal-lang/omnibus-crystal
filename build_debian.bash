#!/bin/bash -e
rvmsudo bash -c "cd /vagrant && bundle && bundle exec omnibus clean crystal shards"
rvmsudo bash -c "cd /vagrant && bundle && CRYSTAL_RELEASE_VERSION=${1} bundle exec omnibus build crystal"
rvmsudo bash -c "cd /vagrant && sudo ./dist/add-deb.sh pkg/crystal_${1}-1_amd64.deb"
