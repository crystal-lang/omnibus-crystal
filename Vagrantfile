# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  [%w(debian bento/debian-8.7), %w(debian32 bento/debian-8.7-i386)].each do |name, box|
    config.vm.define(name) do |c|
      c.vm.box = box

      c.vm.provision :shell, inline: %(
        set -e
        echo "Installing rvm and ruby"
        export DEBIAN_FRONTEND=noninteractive
        curl -#LO https://rvm.io/mpapis.asc
        gpg --import mpapis.asc
        curl -sSL https://raw.githubusercontent.com/rvm/rvm/stable/binscripts/rvm-installer | bash -s stable --ruby
        source /usr/local/rvm/scripts/rvm
        rvm use ruby --default
        gem install bundler

        echo "Preparing omnibus"
        apt-get -q -y  install git reprepro dpkg-sig fakeroot
        mkdir -p /var/lib/bundle
        mount -o bind /var/lib/bundle /vagrant/.bundle
        cd /vagrant
        bundle install --jobs=8
      )
    end
  end

  [%w(darwin osx-el-capitan)].each do |name, box|
    config.vm.define(name) do |c|
      c.vm.box = box

      c.vm.network :private_network, ip: "10.11.12.13"
      c.vm.synced_folder ".", "/vagrant", type: "nfs"

      c.vm.provision :shell, privileged: false, inline: %(
        set -e
        echo "Installing Homebrew"
        /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
        brew install gpg openssl
        echo "Installing rvm and ruby"
        curl -#LO https://rvm.io/mpapis.asc
        gpg --import mpapis.asc
        curl -sSL https://raw.githubusercontent.com/rvm/rvm/stable/binscripts/rvm-installer | bash -s stable --ruby
        source ~/.rvm/scripts/rvm
        rvm use ruby --default
        gem install bundler

        sudo mkdir /var/cache /opt && sudo chown vagrant:vagrant /var/cache /opt

        echo "Preparing omnibus"
        cd /vagrant
        bundle install --jobs=8
      )
    end
  end

  config.vm.synced_folder "~/.gnupg", "/root/.gnupg", owner: "vagrant", group: "vagrant", type: "rsync"

  config.vm.provider "virtualbox" do |vb|
    vb.memory = 8192
    vb.cpus = 8
  end
end
