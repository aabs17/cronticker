#!/bin/bash

set -e  # Hace que el script se detenga si algún comando falla

# Variables
IMAGE_NAME="abts17/cron-ticker:pez"

# Login a Docker Hub
echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin

# Build de la imagen
docker build -t "$IMAGE_NAME" .

# Push de la imagen
docker push "$IMAGE_NAME"

echo "Despliegue completado exitosamente."