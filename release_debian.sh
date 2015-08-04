# 1. copy the previous version of the compiler to crystal-linux
# 2. For the first run, comment any reference to llvm_bin from config/software/crystal.rb
rvmsudo bash
cd /vagrant
bundle
bundle exec omnibus build crystal
# sudo ./dist/add-deb.sh pkg/crystal_<<version>>_amd64.deb
# sudo ./dist/add-deb.sh pkg/crystal_<<version>>_i386.deb
