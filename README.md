# 🚀 Yolo IP3 – Infrastructure Automation with Terraform & Ansible

Welcome to **Yolo IP3**, an automated deployment project for a containerized e-commerce application using **Terraform** and **Ansible**. This solution showcases best practices in **Infrastructure as Code (IaC)** and modern **DevOps** pipelines.

> Built for the IP3 assessment by **Omwoyo John**, this project improves upon earlier implementations through enhanced structure, error handling, and hybrid automation design.

---

## 📦 Project Overview

This repository demonstrates **two progressive stages** of deployment:

- ✅ **Stage 1** – Configuration Management with **Ansible**
- ✅ **Stage 2** – Infrastructure Provisioning using **Terraform + Ansible**

Each stage builds on the previous to deliver a fully automated system—from VM setup to Docker container orchestration.

---

## 🏗️ Architecture

### 🔧 Application Stack

| Component | Description                  |
|-----------|------------------------------|
| Frontend  | React-based shopping client  |
| Backend   | Node.js/Express REST API     |
| Database  | MongoDB with volume binding  |
| Container | Docker + Compose             |
| Infra     | Vagrant-powered Ubuntu VMs   |

### 📚 Technology Stack

- **Provisioning**: Terraform
- **Configuration**: Ansible
- **Containerization**: Docker & Docker Compose
- **Virtualization**: Vagrant + VirtualBox
- **Source Control**: Git + GitHub

---

## 🎯 Stage 1 – Ansible Automation

This stage uses **pure Ansible** to automate:

- Docker setup and networking
- Application code cloning
- Container builds for MongoDB, Backend, and Frontend
- Volume mounting and environment setup

### ✅ Features

- Role-based playbooks for clarity and modularity
- Tag-based execution for flexible deployments
- Centralized variables in `group_vars/`
- MongoDB persistence across restarts
- Clean idempotent re-runs

### ⚙️ Prerequisites

```bash
sudo apt update
sudo apt install -y ansible vagrant virtualbox git curl
ansible --version     # 2.9+ recommended
vagrant --version     # 2.2+ recommended
```

### 🚀 Quick Start

```bash
git clone https://github.com/EngOmwoyoKhalifa/yolo-IP3.git
cd yolo-IP3

# Launch VM
vagrant up

# Deploy with Ansible
ansible-playbook playbook.yml
```

### 🌍 Access the Services

- Frontend: http://localhost:3000  
- Backend API: http://localhost:5000/api  
- MongoDB: mongodb://localhost:27017

---

## 📁 Stage 1 – Role Descriptions

| Role        | Responsibilities |
|-------------|------------------|
| **Common**  | Installs dependencies, sets up folders, clones repo |
| **Docker**  | Installs Docker & Compose, sets up network |
| **Database**| Deploys MongoDB, adds volume & init script |
| **Backend** | Builds API container, connects to DB |
| **Frontend**| Builds React app, links to backend |

---

## 🏗️ Stage 2 – Terraform + Ansible Integration

### 🔄 Hybrid Architecture

- **Terraform** provisions the VM and generates dynamic inventory
- **Ansible** configures the provisioned server and deploys the app stack

This integration allows **single-command deployment** of the full infrastructure and application.

### 🚀 Deploy in One Command

```bash
ansible-playbook deploy.yml
```

### ✅ What It Does

- Initializes Terraform backend
- Applies Terraform plan to provision the VM
- Extracts IP, writes inventory dynamically
- Uses Ansible to configure and deploy containers

---

## 📂 Project Structure

```
yolo-IP3/
├── terraform/
├── ansible/
├── docker-compose.yml
├── mongo-init.js
├── deploy.yml
├── README.md
└── explanation.md
```

---

## 🧪 Test It Works

```bash
ansible webservers -m ping
docker logs backend
docker logs frontend
```

---

## 👨‍💻 IP3 

**Omwoyo John**  
GitHub: [@EngOmwoyoKhalifa](https://github.com/EngOmwoyoKhalifa)

---

<img width="1920" height="1200" alt="vagrant4" src="https://github.com/user-attachments/assets/19134fc9-d854-44d7-8139-13e9bcb7f449" />
<img width="1920" height="1200" alt="vagrant3" src="https://github.com/user-attachments/assets/21b9177a-e656-42ef-a7bf-d9db3ccfbc42" />
<img width="1920" height="1200" alt="vagrant2" src="https://github.com/user-attachments/assets/c5aef580-bba8-47ce-ba7e-fa4e8db296d1" />
<img width="1920" height="1200" alt="vagrant" src="https://github.com/user-attachments/assets/84e59a17-762d-48de-9246-b431fb7beccd" />
