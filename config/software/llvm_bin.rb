name "llvm_bin"
default_version "3.3"

source :url => "http://llvm.org/releases/3.3/clang+llvm-3.3-x86_64-apple-darwin12.tar.gz",
       :md5 => "3c9984ca05f68ca5dc7e06dad92a96ab"

relative_path 'clang+llvm-3.3-x86_64-apple-darwin12'

build do
  copy "#{project_dir}/lib/libLLVM*.a", "#{install_dir}/embedded/lib/"

  %w(clang llvm-config opt llc).each do |bin|
    copy "#{project_dir}/bin/#{bin}", "#{install_dir}/embedded/bin/#{bin}"
  end
end
