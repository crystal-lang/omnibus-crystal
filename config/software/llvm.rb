name "llvm"
default_version "3.5.0"

source :url => "http://llvm.org/releases/3.5.0/llvm-3.5.0.src.tar.xz",
       :md5 => "d6987305a1a0e58e128c1374cd3b8fef"

relative_path "llvm-#{version}.src"

env = with_standard_compiler_flags

build do
  command "./configure" \
          " --enable-targets=host" \
          " --disable-terminfo" \
          " --disable-libffi" \
          " --disable-docs" \
          " --prefix=/opt/llvm35" \
          " --disable-assertions", env: env

  make "-j #{workers}", env: env
  make "install"
end
