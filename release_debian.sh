# 1. copy the previous version of the compiler to crystal-linux
# 2. For the first run, comment any reference to llvm_bin from config/software/crystal.rb
rvmsudo bash
cd /vagrant
bundle
bundle exec omnibus build crystal
# ./dist/add-deb.sh pkg/crystal_<<version>>_amd64.deb
# ./dist/sync (after all)
