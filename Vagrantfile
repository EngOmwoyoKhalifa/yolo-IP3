# Vagrantfile
Vagrant.configure("2") do |config|
  config.vm.box = "geerlingguy/ubuntu2004"
  config.vm.hostname = "yolo-server"
  config.vm.synced_folder ".", "/home/vagrant/yolo"

  config.vm.network "private_network", ip: "192.168.56.10"
  config.vm.network "forwarded_port", guest: 3000, host: 3001, auto_correct: true
  config.vm.network "forwarded_port", guest: 5000, host: 5001, auto_correct: true
  config.vm.network "forwarded_port", guest: 27017, host: 27018, auto_correct: true

  config.vm.provider "virtualbox" do |vb|
    vb.name = "yolo-devops"
    vb.memory = "2048"
    vb.cpus = 2
  end

  config.vm.provision "shell", inline: <<-SHELL
    apt-get update
    apt-get install -y python3 python3-pip
    pip3 install docker docker-compose
  SHELL
end
