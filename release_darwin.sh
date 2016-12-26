# 1. copy the previous version of the compiler to crystal-darwin
#    IMPORTANT: Be sure to copy it from the GitHub download page, not from your machine.
# 2. For the first run, comment any reference to llvm_bin from config/software/crystal.rb
bundle
brew uninstall crystal-lang
brew uninstall bdw-gc
brew uninstall libevent
brew uninstall llvm
brew uninstall llvm36
brew uninstall llvm38
bundle exec omnibus build crystal
