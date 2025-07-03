#!/bin/bash
set -e

echo "Deploying application..."
echo "Running inside Docker container..."


# Ejecuta el playbook
#ansible-playbook /home/rabadiaf/ci-cd-demo-dockerized/playbook.yml
ansible-playbook /app/playbook.yml

echo "✅ Deployment finished."
exec "$@"
