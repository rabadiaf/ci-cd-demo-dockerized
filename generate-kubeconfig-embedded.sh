#!/bin/bash

# Ruta de salida
OUT_FILE="kubeconfig.embedded.yaml"

# Detectar IP accesible desde Docker (usualmente la de docker0)
DOCKER_HOST_IP=$(ip route get 1 | awk '{print $(NF-2); exit}')

# Verificación básica
if [[ -z "$DOCKER_HOST_IP" ]]; then
  echo "❌ No se pudo detectar la IP del host para Docker"
  exit 1
fi

echo "🧭 IP detectada para uso en contenedor: $DOCKER_HOST_IP"

# Exportar config plano desde kubectl
kubectl config view --minify --flatten --raw > "$OUT_FILE"

# Reemplazar 127.0.0.1 o localhost por la IP del host Docker
sed -i "s|https://127.0.0.1|https://$DOCKER_HOST_IP|g" "$OUT_FILE"
sed -i "s|https://localhost|https://$DOCKER_HOST_IP|g" "$OUT_FILE"

echo "✅ kubeconfig embebido generado correctamente en $OUT_FILE"
