# 1. copy the previous version of the compiler to crystal-linux
# 2. For the first run, comment any reference to llvm_bin from config/software/crystal.rb
rvmsudo bash
cd /vagrant
bundle
bundle exec omnibus build crystal

# Point 6
# debian
rvmsudo bash
cd /vagrant
sudo ./dist/add-deb.sh pkg/crystal_0.20.3-1_amd64.deb

# debian32
rvmsudo bash
cd /vagrant
sudo ./dist/add-deb.sh pkg/crystal_0.20.3-1_i386.deb
