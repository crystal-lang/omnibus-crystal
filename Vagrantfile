# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  [%w(debian bento/debian-7.8), %w(debian32 bento/debian-7.8-i386)].each do |name, box|
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

  [%w(centos bento/centos-6.7), %w(centos32 bento/centos-6.7-i386)].each do |name, box|
    config.vm.define(name) do |c|
      c.vm.box = box

      c.vm.provision :shell, inline: %(
        set -e
        echo "%_signature gpg" > ~/.rpmmacros
        echo "%_gpg_name 7CC06B54" >> ~/.rpmmacros

        # Disable IPv6 to avoid weird network issues
        sysctl -w net.ipv6.conf.all.disable_ipv6=1
        sysctl -w net.ipv6.conf.default.disable_ipv6=1

        # Google's DNS to avoid weird DNS issues
        echo "nameserver 8.8.8.8 > /etc/resolv.conf"

        service network restart

        # Update ca-certificates... to avoid weird SSL issues (see https://stackoverflow.com/a/27667111/641451)
        yum -y update ca-certificates

        # IUS provides newer git, compatible with our Omnibus https://ius.io/
        curl -sSL https://setup.ius.io/ | sudo bash

        echo "Installing devtoolset-1.1"
        wget -q http://people.centos.org/tru/devtools-1.1/devtools-1.1.repo -P /etc/yum.repos.d
        echo "enabled=1" >> /etc/yum.repos.d/devtools-1.1.repo
        yum install -q -y devtoolset-1.1

        echo "Installing rvm and ruby"
        curl -#LO https://rvm.io/mpapis.asc
        gpg --import mpapis.asc
        curl -sSL https://raw.githubusercontent.com/rvm/rvm/stable/binscripts/rvm-installer | bash -s stable --ruby
        source /usr/local/rvm/scripts/rvm
        rvm use ruby --default
        gem install bundler

        echo "Preparing omnibus"
        yum install -q -y git2u xz rpm-build fakeroot createrepo python27
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
        brew install gpg openssl cmake
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
