#!/bin/bash

# Step 1: Create Ansible directory structure
mkdir -p ansible/{inventory,group_vars,roles/{common,docker,database,backend,frontend}/tasks}

# Step 2: Create placeholder files
touch ansible/{ansible.cfg,playbook.yml}
touch ansible/inventory/hosts
touch ansible/group_vars/all.yml
touch ansible/roles/common/tasks/main.yml
touch ansible/roles/docker/tasks/main.yml
touch ansible/roles/database/tasks/main.yml
touch ansible/roles/backend/tasks/main.yml
touch ansible/roles/frontend/tasks/main.yml

# Step 3: Create and switch to new git branch
git checkout -b stage2/ansible-setup

# Step 4: Add files to git
git add ansible

# Step 5: Commit changes
git commit -m "feat: scaffold Ansible setup for Stage 2 deployment"

# Step 6: Push to GitHub
git push --set-upstream origin stage2/ansible-setup
