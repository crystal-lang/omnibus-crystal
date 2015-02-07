name "llvm_bin"
default_version "3.5.0-1"

if linux? && _64_bit?
  source_md5 = "83a12467f8b25e315971337454e3935f"
elsif mac_os_x? && _64_bit?
  source_md5 = "11a9ab86f90ba47bd2fd2eb55f843e62"
end

source url: "http://crystal-lang.s3.amazonaws.com/llvm/llvm-#{version}-#{ohai['os']}-#{ohai['kernel']['machine']}.tar.gz",
       md5: source_md5

relative_path "llvm-#{version}"
