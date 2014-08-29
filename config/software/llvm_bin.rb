name "llvm_bin"
default_version "3.3"

if mac_os_x?
  source url: "http://llvm.org/releases/3.3/clang+llvm-3.3-x86_64-apple-darwin12.tar.gz",
         md5: "3c9984ca05f68ca5dc7e06dad92a96ab"

  relative_path 'clang+llvm-3.3-x86_64-apple-darwin12'
elsif ubuntu? && _64_bit?
  source url: "http://llvm.org/releases/3.3/clang+llvm-3.3-amd64-Ubuntu-12.04.2.tar.gz",
         md5: "1059f3232b2eef6f0bee7000a99694a7"

  relative_path 'clang+llvm-3.3-amd64-Ubuntu-12.04.2'
end

BINARIES = %w(clang llvm-config opt llc)

BINARIES.each do |bin|
  whitelist_file bin
end

build do
  copy "#{project_dir}/lib/libLLVM*.a", "#{install_dir}/embedded/lib/"

  BINARIES.each do |bin|
    copy "#{project_dir}/bin/#{bin}", "#{install_dir}/embedded/bin/#{bin}"
  end
end
