#!/bin/bash -e
# TODO: make parameter
CRYSTAL_PREVIOUS_VERSION="0.22.0"
export CRYSTAL_RELEASE_VERSION="0.23.1"
export CRYSTAL_SHARDS_VERSION="0.7.1"

COMPILER_ARCHITECTURES="darwin-x86_64 linux-x86_64 linux-i686"
TARGET_PLATFORMS=${TARGET_PLATFORMS:-"debian debian32 centos centos32 darwin"}

# TODO: Clean pkg/ here?

for compiler_arch in $COMPILER_ARCHITECTURES
do
  compiler_name="crystal-${CRYSTAL_PREVIOUS_VERSION}-${compiler_arch}"
  if [ ! -f "${compiler_name}" ]
  then
    archive_name="crystal-${CRYSTAL_PREVIOUS_VERSION}-1-${compiler_arch}.tar.gz"
    wget "https://github.com/crystal-lang/crystal/releases/download/${CRYSTAL_PREVIOUS_VERSION}/${archive_name}"
    tar xfz "${archive_name}" -O "crystal-${CRYSTAL_PREVIOUS_VERSION}-1/embedded/bin/crystal" >"${compiler_name}"
    rm "${archive_name}"
    chmod +x "${compiler_name}"
  fi
  ln -fs "${compiler_name}" "crystal-${compiler_arch}"
done

for platform in $TARGET_PLATFORMS
do
  vagrant up ${platform}
  vagrant ssh ${platform} -c "/vagrant/build_${platform}.bash ${CRYSTAL_RELEASE_VERSION}"
  vagrant halt ${platform}
done
