#!/bin/bash -e
cd /vagrant && bundle && CRYSTAL_RELEASE_VERSION="${1}" bundle exec omnibus build crystal
