name "llvm"
default_version "3.8.1"

source :url => "http://llvm.org/releases/3.8.1/llvm-3.8.1.src.tar.xz",
       :md5 => "538467e6028bbc9259b1e6e015d25845"

relative_path "llvm-#{version}.src"

whitelist_file "lib/BugpointPasses.dylib"
whitelist_file "lib/libLTO.dylib"
whitelist_file "lib/LLVMHello.dylib"

env = with_standard_compiler_flags(with_embedded_path)

build do
  mkdir "build"

  command "cmake" \
          " -DLLVM_TARGETS_TO_BUILD=host" \
          " -DCMAKE_BUILD_TYPE=MinSizeRel" \
          " -DLLVM_BUILD_TOOLS=OFF" \
          " -DLLVM_ENABLE_ZLIB=OFF" \
          " -DCMAKE_INSTALL_PREFIX=#{install_dir}" \
          " #{project_dir}", env: env,
                             cwd: "#{project_dir}/build"

  command "cmake --build . -- -j#{workers}", env: env, cwd: "#{project_dir}/build"
  command "cmake --build . --target install", env: env, cwd: "#{project_dir}/build"
end
