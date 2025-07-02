#!/bin/bash
#<<<<<<< HEAD
echo "Deploying application..."
sleep 1
echo "Application deployed successfully!"
#=======
echo "Running inside Docker container..."
sleep 1
echo "Running Ansible playbook..."
ansible-playbook playbook.yml
#>>>>>>> 8bad041 (Primer commit para activar CI/CD)
