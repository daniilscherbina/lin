#!/bin/bash

# Проверяем, что переданы все необходимые аргументы
if [ $# -ne 6 ]; then
  echo "Usage: $0 <image_tag> <db_host> <db_port> <db_name> <db_user> <db_password>"
  echo "Example: $0 v1.2 db.example.com 5432 mydb user secret123"
  exit 1
fi

# Аргументы:
TAG=$1            # Версия образа (например, v1.0)
DB_HOST=$2        # Хост БД
DB_PORT=$3        # Порт БД
DB_NAME=$4        # Имя базы данных
DB_USER=$5        # Пользователь БД
DB_PASSWORD=$6    # Пароль БД

CONTAINER_NAME="kubsu-container"

echo "Updating container with tag: $TAG"
echo "Database connection settings:"
echo " - Host: $DB_HOST"
echo " - Port: $DB_PORT"
echo " - DB Name: $DB_NAME"
echo " - User: $DB_USER"

# 1. Скачиваем новый образ
docker pull docker.io/deploy320/app:latest-$TAG || { echo "Failed to pull image"; exit 1; }

# 2. Останавливаем и удаляем старый контейнер
docker stop $CONTAINER_NAME || true
docker rm $CONTAINER_NAME || true

# 3. Запускаем новый контейнер с переменными окружения
docker run -d \
  --network host \
  --name $CONTAINER_NAME \
  -e DB_HOST="$DB_HOST" \
  -e DB_PORT="$DB_PORT" \
  -e DB_NAME="$DB_NAME" \
  -e DB_USER="$DB_USER" \
  -e DB_PASSWORD="$DB_PASSWORD" \
  docker.io/deploy320/app:latest-$TAG || { echo "Failed to start container"; exit 1; }

echo "✅ Container successfully updated with new image and DB settings"
