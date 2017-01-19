# 1. copy the previous version of the compiler to crystal-darwin
#    IMPORTANT: Be sure to copy it from the GitHub download page, not from your machine.
# 2. For the first run, comment any reference to llvm_bin from config/software/crystal.rb
bundle
brew uninstall crystal-lang --force
brew uninstall bdw-gc --force
brew uninstall libevent --force
brew uninstall llvm --force
brew uninstall llvm36 --force
brew uninstall llvm38 --force
bundle exec omnibus build crystal
