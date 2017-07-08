SHARDS_VERSION = ENV['CRYSTAL_SHARDS_VERSION'] || "0.7.1"

name "shards"
default_version SHARDS_VERSION

dependency "crystal"
dependency "libyaml"

source url: "https://github.com/ysbaddaden/shards/archive/v#{version}.tar.gz",
       md5: "ab38cb47e97f93ffd7960dbcca33b5d6"

relative_path "shards-#{version}"
env = with_standard_compiler_flags(with_embedded_path)

build do
  command "#{install_dir}/bin/crystal" \
          " build" \
          " -o #{install_dir}/embedded/bin/shards" \
          " src/shards.cr" \
          " --no-debug" \
          " --release ", env: env
end
