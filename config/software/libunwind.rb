name "libunwind"
default_version "1.1"

source url: "http://download.savannah.gnu.org/releases/libunwind/libunwind-#{version}.tar.gz",
       md5: "fb4ea2f6fbbe45bf032cd36e586883ce"

relative_path "libunwind-#{version}"

env = with_standard_compiler_flags(with_embedded_path)
env["CFLAGS"] << " -fPIC"

build do
  command "./configure" \
          " --disable-debug" \
          " --disable-dependency-tracking" \
          " --disable-shared" \
          " --prefix=#{install_dir}/embedded", env: env

  make "-j #{workers}"
  make "install"
end
