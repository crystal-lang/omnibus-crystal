# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  [%w(debian chef/debian-7.4), %w(debian32 chef/debian-7.4-i386)].each do |name, box|
    config.vm.define(name) do |c|
      c.vm.box = box

      c.vm.provision :shell, inline: %(
        echo "Installing rvm and ruby"
        export DEBIAN_FRONTEND=noninteractive
        gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
        curl -sSL https://get.rvm.io | bash -s stable --ruby

        echo "Preparing omnibus"
        apt-get -q -y  install git reprepro dpkg-sig
        mkdir -p /var/lib/bundle
        mount -o bind /var/lib/bundle /vagrant/.bundle
        cd /vagrant
        bundle install --jobs=8
      )
    end
  end

  [%w(centos chef/centos-6.5), %w(centos32 chef/centos-6.5-i386)].each do |name, box|
    config.vm.define(name) do |c|
      c.vm.box = box

      c.vm.provision :shell, inline: %(
        echo "%_signature gpg" > ~/.rpmmacros
        echo "%_gpg_name 7CC06B54" >> ~/.rpmmacros

        echo "Installing devtoolset-1.1"
        wget -q http://people.centos.org/tru/devtools-1.1/devtools-1.1.repo -P /etc/yum.repos.d
        echo "enabled=1" >> /etc/yum.repos.d/devtools-1.1.repo
        yum install -q -y devtoolset-1.1

        echo "Installing rvm and ruby"
        gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
        curl -sSL https://get.rvm.io | bash -s stable --ruby

        echo "Preparing omnibus"
        yum install -q -y git xz rpm-build fakeroot createrepo
        mkdir -p /var/lib/bundle
        mount -o bind /var/lib/bundle /vagrant/.bundle
        cd /vagrant
        bundle install --jobs=8
      )
    end
  end

  config.vm.synced_folder "~/.gnupg", "/root/.gnupg", owner: "root", group: "root", type: "rsync"

  config.vm.provider "virtualbox" do |vb|
    vb.memory = 4096
    vb.cpus = 8
  end
end
