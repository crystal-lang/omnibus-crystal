name "llvm_bin"
default_version "3.8.1-5"

if linux?
  if _64_bit?
    source_md5 = "caad082be8d516e1b8c8c097697bcbf6"
  else
    source_md5 = "98e6e61609b90440a7e374f50a410af7"
  end
elsif mac_os_x? && _64_bit?
  source_md5 = "15940cbab428468f24fcd93e3b773d09"
end

source url: "http://crystal-lang.s3.amazonaws.com/llvm/llvm-#{version}-#{ohai['os']}-#{ohai['kernel']['machine']}.tar.gz",
       md5: source_md5

relative_path "llvm-#{version}"
