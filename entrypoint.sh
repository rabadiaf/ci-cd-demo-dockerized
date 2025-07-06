#!/bin/bash
set -e

echo "Starting deployment..."

ansible-playbook /app/playbook.yml

echo "Deployment finished."
