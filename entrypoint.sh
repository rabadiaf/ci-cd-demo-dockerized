#!/bin/bash

echo "Deploying application..."
echo "Running inside Docker container..."

if [ "$CI" = "true" ]; then
  echo "⚠️ CI environment detected — skipping real kubectl apply"
  ansible-playbook /app/playbook.yml --extra-vars "simulate=true"
else
  echo "✅ Local environment — applying manifests with kubectl"
  ansible-playbook /app/playbook.yml
fi
