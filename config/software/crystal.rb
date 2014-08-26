name "crystal"
default_version "0.4.3"

source git: "https://github.com/manastech/crystal"

dependency "openssl"
dependency "pcre"
dependency "bdw-gc"
dependency "llvm_bin"

build do
  env = with_standard_compiler_flags(with_embedded_path(
    "LIBRARY_PATH" => "#{install_dir}/embedded/lib"
  ))

  command "bin/crystal --setup"
  command "make clean crystal", env: env
  # command "bin/crystal src/compiler/crystal.cr --verbose", env: env

  block do
    raise "Could not build crystal" unless File.exists?("#{project_dir}/.build/crystal")
  end

  copy "#{project_dir}/.build/crystal", "#{install_dir}/embedded/bin/crystal"
  sync "#{project_dir}/src", "#{install_dir}/src"
  sync "#{project_dir}/libs", "#{install_dir}/libs"

  erb source: "crystal.erb",
      dest: "#{install_dir}/bin/crystal",
      mode: 0755,
      vars: { install_dir: install_dir }

end
