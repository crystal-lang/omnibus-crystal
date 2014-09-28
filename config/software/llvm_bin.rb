name "llvm_bin"
default_version "3.5.0"

if linux? && _64_bit?
  source url: "http://crystal-lang.s3.amazonaws.com/llvm-3.5.0-linux64.tar.gz",
         md5: "1b6d08cc7f9890db67fcf60f41e84279"
end

relative_path "llvm35"
