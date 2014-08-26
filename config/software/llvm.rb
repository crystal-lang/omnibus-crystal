name "llvm"
default_version "3.4.2"

source :url => "http://llvm.org/releases/3.4.2/llvm-3.4.2.src.tar.gz",
       :md5 => "a20669f75967440de949ac3b1bad439c"

dependency "clang"
relative_path 'llvm-3.4.2.src'

whitelist_file "lib/BugpointPasses.dylib"
whitelist_file "lib/libclang.dylib"
whitelist_file "lib/libLTO.dylib"
whitelist_file "lib/LLVMHello.dylib"

env = with_standard_compiler_flags

build do
  clang = Omnibus::Software.load(project, "clang")
  copy clang.project_dir, "#{project_dir}/tools/clang"

  command "./configure" \
          " --enable-targets=host" \
          " --prefix=#{install_dir}/embedded", env: env

  make "-j #{workers}"
  make "install"
end
