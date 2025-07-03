#!/bin/bash

echo "Deploying application..."
echo "Running inside Docker container..."

if [ "$CI" == "true" ]; then
  echo "📦 CI detected — SIMULATING deployment..."
  echo "✅ Simulated: kubectl apply -f /app/deployment.yaml"
else
  echo "🚀 Running real deployment with kubectl..."
  kubectl apply --validate=false -f /app/deployment.yaml
fi
