#!/bin/bash

CONTAINER_NAME="kubsu-container"
IMAGE="docker.io/deploy320/app:latest"

echo "Updating container"

podman pull $IMAGE || { echo "Failed to pull image"; exit 1; }

podman stop $CONTAINER_NAME || true
podman rm $CONTAINER_NAME || true

podman run -d \
  --network host \
  --name $CONTAINER_NAME \
  -e DB_HOST="$DB_HOST" \
  -e DB_PORT="$DB_PORT" \
  -e DB_NAME="$DB_NAME" \
  -e DB_USER="$DB_USER" \
  -e DB_PASSWORD="$DB_PASSWORD" \
  $IMAGE || { echo "Failed to start container"; exit 1; }

echo "✅ Container successfully updated with new image and DB settings"
