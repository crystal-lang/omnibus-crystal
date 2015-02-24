name 'libpcl'
maintainer 'Juan Wajnerman'
homepage 'http://xmailserver.org/libpcl.html'

install_dir '/opt/libpcl'
build_version do
  source :version, from_dependency: 'libpcl'
end
build_iteration 1

dependency 'libpcl'
dependency 'tgz_package' if mac_os_x? || centos?

exclude '\.git*'
exclude 'bundler\/git'
