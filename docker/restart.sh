#!/bin/bash

if [ $# -ne 6 ]; then
  echo "Usage: $0 <image_tag>"
  exit 1
fi

TAG=$1 

CONTAINER_NAME="kubsu-container"
IMAGE="docker.io/deploy320/app:latest-$TAG"

echo "Updating container with tag: $TAG"
echo "Database connection settings:"
echo " - Host: $DB_HOST"
echo " - Port: $DB_PORT"
echo " - DB Name: $DB_NAME"
echo " - User: $DB_USER"

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
