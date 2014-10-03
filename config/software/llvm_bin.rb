name "llvm_bin"
default_version "3.5.0-1"

if linux? && _64_bit?
  source url: "http://crystal-lang.s3.amazonaws.com/llvm-3.5.0-linux64.tar.gz",
         md5: "1b6d08cc7f9890db67fcf60f41e84279"
elsif mac_os_x? && _64_bit?
  source url: "http://crystal-lang.s3.amazonaws.com/llvm/llvm-#{version}-darwin-x86_64.tar.gz",
         md5: "47fce36fb08ca27e62a538c377a3e1a1"
end

relative_path "llvm-#{version}"
