name 'llvm'
maintainer 'Juan Wajnerman'
homepage 'http://llvm.org/'

install_dir '/opt/llvm'
build_version do
  source :version, from_dependency: 'llvm'
end
build_iteration 1

dependency 'llvm'
dependency 'tgz_package' if mac_os_x? || centos?

exclude '\.git*'
exclude 'bundler\/git'
