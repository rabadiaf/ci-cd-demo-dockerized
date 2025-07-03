#!/bin/bash

# Ruta original del kubeconfig
ORIGINAL_CONFIG="$HOME/.kube/config"

# Ruta destino para usar dentro del contenedor
CONTAINER_CONFIG="$HOME/ci-cd-demo-dockerized/kubeconfig.container"

# Detectar puerto real del API server
APISERVER_PORT=$(kubectl config view -o jsonpath='{.clusters[?(@.name=="minikube")].cluster.server}' | grep -o '[0-9]\{4,5\}' | head -n1)

# Detectar IP del host desde la perspectiva del contenedor (interfaz `docker0` o `eth0`)
HOST_IP=$(ip route get 1.1.1.1 | awk '{print $7; exit}')

echo "🧠 Detectado Minikube API Server en puerto: $APISERVER_PORT"
echo "🌐 Detectado IP del host: $HOST_IP"
echo "📄 Generando kubeconfig.container..."

# Clonar el archivo original
cp "$ORIGINAL_CONFIG" "$CONTAINER_CONFIG"

# Reemplazar IP y puerto por uno que sea visible desde el contenedor
sed -i "s|https://127.0.0.1:[0-9]*|https://$HOST_IP:$APISERVER_PORT|g" "$CONTAINER_CONFIG"

echo "✅ Archivo generado en: $CONTAINER_CONFIG"
