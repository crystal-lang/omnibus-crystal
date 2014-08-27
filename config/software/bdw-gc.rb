name "bdw-gc"
default_version "7.4.2"

source :url => "https://github.com/ivmai/bdwgc/archive/gc7_4_2.tar.gz",
       :md5 => "ef64e9927f4670daebc4b9399278fb72"

dependency "libatomic_ops"

relative_path 'bdwgc-gc7_4_2'

env = with_standard_compiler_flags

build do
  command "autoreconf -vif"
  command "automake --add-missing"
  command "./configure" \
          " --disable-debug" \
          " --disable-dependency-tracking" \
          " --disable-shared" \
          " --prefix=#{install_dir}/embedded", env: env


  make "-j #{workers}"
  make "install"
end
