#!/bin/bash
set -e

echo "Deploying application..."
echo "Running inside Docker container..."

if [ "$CI" = "true" ]; then
  echo "CI mode detected: Simulating deployment"
  # Simulación: crear un archivo dummy para simular que algo cambió
  touch /app/deploy-simulated.txt
  echo "Deployment simulation completed."
else
  echo "Running real deployment..."

  # Aquí va tu lógica real para aplicar manifests, por ejemplo:
  kubectl apply --validate=false -f /app/deployment.yaml
fi
