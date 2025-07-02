#!/bin/bash

set -e

REPO="rabadiaf/ci-demo"
DEPLOYMENT_FILE="deployment.yaml"

echo "🚀 Haciendo push a GitHub..."
git add .
git commit -m "🚀 Actualización automática para despliegue"
git push origin main

echo "🕒 Esperando 30 segundos para que GitHub Actions construya y suba la imagen..."
sleep 30  # puedes aumentar a 60 si el build es más lento

echo "☸️ Aplicando despliegue con kubectl..."
kubectl apply -f $DEPLOYMENT_FILE

echo "✅ ¡Despliegue completo!"
