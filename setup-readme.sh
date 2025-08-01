# ⚙️ Infrastructure Automation for YOLO Shop with Ansible & Terraform

Welcome to **YOLO-IP3**, an end-to-end infrastructure automation project that leverages modern DevOps tooling to provision, configure, and deploy a Dockerized e-commerce platform built with **React**, **Node.js**, and **MongoDB**.

This implementation demonstrates best practices in Infrastructure as Code (IaC) using **Terraform** and **Ansible**, and runs on a Vagrant-provisioned virtualized environment.

---

## 🚧 Project Stages

| Stage | Description |
|-------|-------------|
| **Stage 1** | Uses Ansible roles to provision and deploy the full containerized stack |
| **Stage 2** | Combines Terraform (for VM provisioning) with Ansible (for configuration) |

---

## 🏗️ Architecture Overview

### 📦 Application Stack
- **Frontend** – React e-commerce client (Dockerized)
- **Backend** – Node.js Express REST API (Dockerized)
- **Database** – MongoDB with data persistence (Dockerized)

### 🛠️ DevOps Tooling
| Layer             | Tool                      |
|------------------|---------------------------|
| Provisioning     | Terraform + Vagrant       |
| Configuration    | Ansible (role-based)      |
| Containerization | Docker + Docker Compose   |
| Virtualization   | VirtualBox                |
| Version Control  | Git + GitHub              |

---

## 🧪 Prerequisites

```bash
sudo apt update
sudo apt install -y ansible vagrant virtualbox git terraform docker.io docker-compose
Check tool versions:

bash
Copy
Edit
ansible --version
vagrant --version
terraform --version
🎯 Stage 1 – Ansible Configuration Management
🔧 What It Does
Clones the app repository into the VM

Installs Docker and Docker Compose

Creates and connects containers

Ensures MongoDB stores data persistently

Makes services accessible on local ports

🧩 Role Descriptions
Role	Tasks Handled
common	Package installation, repo cloning, app directory setup
docker	Docker + Compose installation and configuration
database	MongoDB container setup, volume mounting, and init script
backend	Builds backend image, connects to MongoDB
frontend	Builds frontend image, connects to backend API

🧪 Deployment Commands
bash
Copy
Edit
# Start VM
vagrant up

# Check Ansible connectivity
ansible webservers -m ping

# Run the Ansible playbook
ansible-playbook playbook.yml
🌐 Application Access
Frontend: http://localhost:3000

Backend: http://localhost:5000/api

MongoDB: mongodb://localhost:27017

🚀 Stage 2 – Terraform + Ansible Integration
This stage adds Terraform for provisioning infrastructure and uses Ansible for configuration—seamlessly integrated in a single Ansible playbook (deploy.yml).

🛠️ Workflow
bash
Copy
Edit
ansible-playbook deploy.yml
This performs:

VM provisioning with Terraform

Extraction of VM IP and SSH credentials

Configuration of the instance with Ansible

Deployment of application containers

🧱 Terraform Components
File	Purpose
main.tf	Defines virtual machine and SSH configuration
variables.tf	Declares input variables
terraform.tfvars	Stores real input values
outputs.tf	Defines values used by Ansible
Vagrantfile.tpl	VM template
inventory.tpl	Template for dynamic Ansible inventory

🗂️ Project Structure
csharp
Copy
Edit
yolo-IP3/
├── ansible/
│   ├── group_vars/
│   ├── inventory/
│   ├── roles/
│   ├── playbook.yml
│   └── ansible.cfg
├── terraform/
│   ├── main.tf
│   ├── outputs.tf
│   ├── terraform.tfvars
│   └── inventory.tpl
├── backend/
├── client/
├── mongo-init.js
├── deploy.yml
└── README.md
🧠 Git Branching Strategy
Branch	Purpose
main	Final stable version
stage2/deploy	Terraform + Ansible automation
readme	Documentation updates
docker-main	Pure Docker implementation (optional)

📸 Screenshots
See attached screeshots

👨‍💻 Author
Omwoyo John
DevOps Engineer & Infrastructure Enthusiast
GitHub: @EngOmwoyoKhalifa


