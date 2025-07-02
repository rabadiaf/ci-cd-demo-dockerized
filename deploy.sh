#!/bin/bash

set -e

REPO="rabadiaf/ci-demo"
DEPLOYMENT_FILE="deployment.yaml"
DEPLOYMENT_NAME="ci-demo"
NAMESPACE="default"

# 1. Configurar git user si no está definido
if ! git config user.name > /dev/null; then
  echo "⚙️  Configurando nombre de usuario Git..."
  git config --global user.name "Rodolfo Abadia"
fi

if ! git config user.email > /dev/null; then
  echo "⚙️  Configurando email de usuario Git..."
  git config --global user.email "rabadiaf@gmail.com"
fi

# 2. Hacer pull --rebase antes del push
echo "🔄 Sincronizando con rama remota..."
git pull --rebase origin main

# 3. Hacer commit y push
echo "🚀 Haciendo push a GitHub..."
git add .
git commit -m "🚀 Actualización automática para despliegue"
git push origin main

# 4. Esperar a que GitHub construya la imagen
echo "🕒 Esperando 60 segundos para que GitHub Actions suba la nueva imagen..."
sleep 60

# 5. Desplegar en Minikube
echo "☸️ Aplicando despliegue con kubectl..."
kubectl apply -f "$DEPLOYMENT_FILE"

# 6. Verificar estado del pod
echo "🔍 Verificando estado del despliegue..."
sleep 5

kubectl rollout status deployment "$DEPLOYMENT_NAME" -n "$NAMESPACE"

echo "✅ ¡Despliegue completo y saludable!"
