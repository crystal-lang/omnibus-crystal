# 1. copy the previous version of the compiler to crystal-linux
# 2. For the first run, comment any reference to llvm_bin from config/software/crystal.rb
rvmsudo bash
cd /vagrant
scl enable devtoolset-1.1 bash
bundle
bundle exec omnibus build crystal
# ./dist/add-rpm.sh pkg/crystal-<version>-1.x86_64.rpm
# ./dist/sync (after all)
