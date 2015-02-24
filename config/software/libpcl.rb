name "libpcl"
default_version "1.12"

source url: "http://xmailserver.org/pcl-#{version}.tar.gz",
       md5: "816d394743d8ab1b3e20af1efebb093d"

relative_path "pcl-#{version}"
env = with_standard_compiler_flags(with_embedded_path)

build do
  command "./configure" \
          " --disable-dependency-tracking" \
          " --prefix=#{install_dir}"
  make "-j #{workers}", env: env
  make  "install"
end
