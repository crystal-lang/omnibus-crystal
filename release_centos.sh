# 1. copy the previous version of the compiler to crystal-linux
# 2. For the first run, comment any reference to llvm_bin from config/software/crystal.rb
rvmsudo bash
cd /vagrant
scl enable devtoolset-1.1 bash
bundle
bundle exec omnibus build crystal

# Point 6
# centos
rvmsudo bash
cd /vagrant
sudo ./dist/add-rpm.sh pkg/crystal-0.18.7-1.x86_64.rpm

# centos32
rvmsudo bash
cd /vagrant
sudo ./dist/add-rpm.sh pkg/crystal-0.18.7-1.i686.rpm
