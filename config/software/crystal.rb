name "crystal"
default_version "0.5.0"

source git: "https://github.com/manastech/crystal"

dependency "pcre"
dependency "bdw-gc"
dependency "llvm_bin"
dependency "libunwind" unless mac_os_x?

env = with_standard_compiler_flags(with_embedded_path(
  "LIBRARY_PATH" => "#{install_dir}/embedded/lib"
))

llvm_bin = Omnibus::Software.load(project, "llvm_bin")
env["PATH"] = "#{llvm_bin.project_dir}/bin:#{env["PATH"]}"

build do
  command "git checkout .", cwd: project_dir
  patch source: "boehm_cr_pthread.patch"
  patch source: "lib_crypto_cr.patch"

  mkdir "#{project_dir}/deps"
  copy "#{Dir.pwd}/crystal-#{ohai['os']}", "#{project_dir}/deps/crystal"
  command "make clean crystal release=1", env: env

  block do
    raise "Could not build crystal" unless File.exists?("#{project_dir}/.build/crystal")
  end

  copy "#{project_dir}/.build/crystal", "#{install_dir}/embedded/bin/crystal"
  sync "#{project_dir}/src", "#{install_dir}/src"
  sync "#{project_dir}/libs", "#{install_dir}/libs"
  sync "#{project_dir}/samples", "#{install_dir}/samples"
  mkdir "#{install_dir}/bin"

  erb source: "crystal.erb",
      dest: "#{install_dir}/bin/crystal",
      mode: 0755,
      vars: { install_dir: install_dir }
end
