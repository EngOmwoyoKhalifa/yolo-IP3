mkdir -p terraform/.terraform/providers/registry.terraform.io && cd terraform

# Create main.tf
cat > main.tf <<'EOF'
terraform {
  required_version = ">= 1.3.0"
}

resource "null_resource" "vagrant_up" {
  provisioner "local-exec" {
    command = "vagrant up"
  }
}
EOF

# Create variables.tf
cat > variables.tf <<'EOF'
variable "vm_ip" {
  type        = string
  default     = "192.168.99.55"
  description = "Private IP for the application VM"
}
EOF

# Create terraform.tfvars
cat > terraform.tfvars <<'EOF'
vm_ip = "192.168.99.55"
EOF

# Create outputs.tf
cat > outputs.tf <<'EOF'
output "vm_ip" {
  value = var.vm_ip
}

output "vm_name" {
  value = "yolo-devops-node"
}

output "app_endpoints" {
  value = {
    frontend = "http://${var.vm_ip}:3000"
    backend  = "http://${var.vm_ip}:5000"
  }
}
EOF

# Create inventory.tpl
cat > inventory.tpl <<'EOF'
[web]
${vm_ip} ansible_user=vagrant ansible_ssh_private_key_file=.vagrant/machines/default/virtualbox/private_key ansible_python_interpreter=/usr/bin/python3
EOF

# Create Vagrantfile.tpl
cat > Vagrantfile.tpl <<'EOF'
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
EOF

# Create .gitignore for terraform folder
cat > .gitignore <<'EOF'
.terraform/
terraform.tfstate
terraform.tfstate.backup
EOF

echo "✅ Terraform folder setup complete in $(pwd)"
