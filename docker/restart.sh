echo $1
podman pull docker.io/deploy320/app:latest-$1
podman tag docker.io/deploy320/app:latest-$1 kubsu
podman compose restart
