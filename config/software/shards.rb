name "shards"
default_version "0.6.1"

dependency "crystal"
dependency "libyaml"

source url: "https://github.com/ysbaddaden/shards/archive/v#{version}.tar.gz",
       md5: "2870bafe45088b4ec73017c96186ac27"

relative_path "shards-#{version}"
env = with_standard_compiler_flags(with_embedded_path)

build do
  command "#{install_dir}/bin/crystal" \
          " build" \
          " -o #{install_dir}/embedded/bin/shards" \
          " src/shards.cr" \
          " --release ", env: env
end
