# -*- mode: ruby -*-
# vi: set ft=ruby :
# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"
Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  #config.vm.box = "http://hglab.realworld.jp/boxes/CentOS-6.4-x86_64-minimal.box"
  config.vm.box = "chef/centos-7.0"
  config.omnibus.chef_version = :latest
  config.berkshelf.enabled = false
  config.vm.define :web01 do | node |
    node.vm.hostname = "web01"
    node.vm.network :private_network, ip: "192.168.5.1", virtualbox__intnet: "intnet"
    node.vm.provision "chef_solo" do |chef|
      chef.roles_path = "roles"
      chef.cookbooks_path = ["cookbooks", "realworld-cookbooks", "berks-cookbooks", "vendor-cookbooks"]
      chef.data_bags_path = "data_bags"
  #    chef.add_role("yum-repo")
      chef.add_role("sshd_config")
  #    chef.run_list = [
  #    ]
    end
  end

  #config.vm.define :img01 do | node |
  #  node.vm.hostname = "img01"
  #  node.vm.network :private_network, ip: "192.168.5.2", virtualbox__intnet: "intnet"
  #  node.vm.provision "chef_solo" do |chef|
  #    chef.roles_path = "roles"
  #    chef.cookbooks_path = ["cookbooks", "realworld-cookbooks", "berks-cookbooks", "vendor-cookbooks"]
  #    chef.data_bags_path = "data_bags"
  #    chef.add_role("yum-repo")
  #    chef.add_role("sshd_config")
  #    chef.run_list = [
  #    ]
  #  end
  #end
  
  #config.vm.define :db01 do | node |
  #  node.vm.hostname = "db01"
  #  node.vm.network :private_network, ip: "192.168.5.3", virtualbox__intnet: "intnet"
  #  node.vm.provision "chef_solo" do |chef|
  #    chef.roles_path = "roles"
  #    chef.cookbooks_path = ["cookbooks", "realworld-cookbooks", "berks-cookbooks", "vendor-cookbooks"]
  #    chef.data_bags_path = "data_bags"
  #    chef.add_role("yum-repo")
  #    chef.add_role("sshd_config")
  #    chef.run_list = [
  #    ]
  #  end
  #end
end

