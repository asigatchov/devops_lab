Vagrant.configure("2") do |config|
  config.vm.box = "fgrehm/precise64-lxc"
 
  config.vm.provider :lxc do |lxc, conf|
    lxc.customize 'cgroup.memory.limit_in_bytes', '1024M'
    conf.vm.provision :chef_zero do |chef|
      chef.log_level = :info
      chef.cookbooks_path = "cookbooks"
      chef.roles_path = "roles"
      chef.data_bags_path = "data_bags"
      chef.add_recipe  "app_demo"
    end
  end
end
