name "llvm"
default_version "3.5.0"

source :url => "http://llvm.org/releases/3.5.0/llvm-3.5.0.src.tar.xz",
       :md5 => "d6987305a1a0e58e128c1374cd3b8fef"

relative_path "llvm-#{version}.src"

whitelist_file "lib/BugpointPasses.dylib"
whitelist_file "lib/libLTO.dylib"
whitelist_file "lib/LLVMHello.dylib"

env = with_standard_compiler_flags(with_embedded_path)

build do
  patch source: 'PR20800.patch', plevel: 0
  command "./configure" \
          " --enable-targets=host" \
          " --disable-terminfo" \
          " --disable-libffi" \
          " --disable-zlib" \
          " --disable-docs" \
          " --prefix=#{install_dir}" \
          " --disable-shared" \
          " --enable-optimized" \
          " --disable-assertions", env: env

  make "-j #{workers}", env: env
  make "install"
end
