name "shards"
default_version "0.5.3"

dependency "crystal"
dependency "libyaml"

source url: "https://github.com/ysbaddaden/shards/archive/v#{version}.tar.gz",
       md5: "6dac5b08a158ec56011a1708f44da155"

relative_path "shards-#{version}"
env = with_standard_compiler_flags(with_embedded_path)

build do
  command "#{install_dir}/bin/crystal" \
          " build" \
          " -o #{install_dir}/embedded/bin/shards" \
          " src/shards.cr" \
          " --release ", env: env
end
