Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/bionic64"
  config.vm.hostname = "khalifa-yolo"
  config.vm.network "private_network", ip: "192.168.100.20"
  config.vm.network "forwarded_port", guest: 3000, host: 3100
  config.vm.network "forwarded_port", guest: 5000, host: 5100
  config.vm.network "forwarded_port", guest: 27017, host: 27117

  config.vm.provider "virtualbox" do |vb|
    vb.memory = "2048"
    vb.cpus = 2
  end

  config.vm.synced_folder ".", "/home/vagrant/app"

  config.vm.provision "shell", inline: <<-SHELL
    apt-get update
    apt-get install -y python3 python3-pip
    pip3 install docker docker-compose
  SHELL
end
