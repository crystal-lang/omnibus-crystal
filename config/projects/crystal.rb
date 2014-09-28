name 'crystal'
maintainer 'Juan Wajnerman'
homepage 'http://crystal-lang.org/'

install_dir '/opt/crystal'
build_version do
  source :version, from_dependency: 'crystal'
end
build_iteration 1

# creates required build directories
dependency 'preparation'

# crystal dependencies/components
dependency 'crystal'

# version manifest file
dependency 'version-manifest'

exclude '\.git*'
exclude 'bundler\/git'
