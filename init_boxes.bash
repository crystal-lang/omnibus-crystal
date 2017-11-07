#!/bin/bash -e
TARGET_PLATFORMS=${TARGET_PLATFORMS:-"debian debian32 centos centos32 darwin"}

for platform in $TARGET_PLATFORMS
do
  vagrant destroy -f "${platform}"
  vagrant up --provision "${platform}"
  vagrant halt "${platform}"
  vagrant snapshot save "${platform}" "${platform}"
done
