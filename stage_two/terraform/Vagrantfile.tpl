Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/focal64"
  config.vm.hostname = "yolo-devops-node"
  config.vm.network "private_network", ip: "${vm_ip}"
  config.vm.network "forwarded_port", guest: 3000, host: 3001, auto_correct: true
  config.vm.network "forwarded_port", guest: 5000, host: 5001, auto_correct: true
  config.vm.network "forwarded_port", guest: 27017, host: 27018, auto_correct: true

  config.vm.provider "virtualbox" do |vb|
    vb.memory = 2048
    vb.cpus = 2
  end

  config.vm.provision "shell", inline: <<-SHELL
    apt-get update
    apt-get install -y python3 python3-pip git curl
    pip3 install docker docker-compose
  SHELL
end
