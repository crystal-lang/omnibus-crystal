name 'crystal'
maintainer 'Juan Wajnerman'
homepage 'http://crystal-lang.org/'

install_dir '/opt/crystal'
build_version do
  source :version, from_dependency: 'crystal'
end
build_iteration 1

dependency 'crystal'
dependency 'shards'
dependency 'tgz_package' if mac_os_x? || centos?

exclude '\.git*'
exclude 'bundler\/git'
