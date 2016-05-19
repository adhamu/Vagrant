VAGRANTFILE_API_VERSION = "2"
CODE_DIRECTORY = "~/Development/"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "chef/centos-6.5"
  config.vm.network "private_network", ip: "192.168.33.10"
  config.vm.synced_folder CODE_DIRECTORY, "/var/www/html", :mount_options => ["dmode=777","fmode=666"]
  config.vm.network :forwarded_port, guest: 80, host: 1234
  config.vm.network :forwarded_port, guest: 3000, host: 3000
  config.vm.network :forwarded_port, guest: 22, host: 2224, id: 'ssh', auto_correct: true
  config.vm.provision :shell, :path => "provision.sh"
  config.vm.provision :shell, :path => "after-boot.sh"
end
