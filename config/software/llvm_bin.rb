name "llvm_bin"
default_version "3.8.1-2"

if linux?
  if _64_bit?
    source_md5 = "c76a79bebecde3e4bd6483e822ce8064"
  else
    source_md5 = "28c340a86261f19358ddc329cbb6e3db"
  end
elsif mac_os_x? && _64_bit?
  source_md5 = "a7d9881e90ad4bcb9d83cb7d5386cadd"
end

source url: "http://crystal-lang.s3.amazonaws.com/llvm/llvm-#{version}-#{ohai['os']}-#{ohai['kernel']['machine']}.tar.gz",
       md5: source_md5

relative_path "llvm-#{version}"
