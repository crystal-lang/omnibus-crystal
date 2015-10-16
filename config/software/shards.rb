name "shards"
default_version "0.5.1"

dependency "crystal"
dependency "libyaml"

source url: "https://github.com/ysbaddaden/shards/archive/v#{version}.tar.gz",
       md5: "e61930c5eefa21a9ed7a5a5f2302d9ff"

relative_path "shards-#{version}"
env = with_standard_compiler_flags(with_embedded_path)

build do
  patch source: "shards.patch"
  command "#{install_dir}/bin/crystal" \
          " build" \
          " -o #{install_dir}/embedded/bin/shards" \
          " src/shards.cr" \
          " --release ", env: env
end
