name "llvm_bin"
default_version "3.8.1-3"

if linux?
  if _64_bit?
    source_md5 = "937e9935a1bf5e22f05770e4ab9b58ee"
  else
    source_md5 = "965b851e3ff7fbbc4bf487a4f3158b38"
  end
elsif mac_os_x? && _64_bit?
  source_md5 = "750bf46f4610996b2fbffb3fcffc42ec"
end

source url: "http://crystal-lang.s3.amazonaws.com/llvm/llvm-#{version}-#{ohai['os']}-#{ohai['kernel']['machine']}.tar.gz",
       md5: source_md5

relative_path "llvm-#{version}"
