#!/bin/env bash

export DEBIAN_FRONTEND=noninteractive
sudo apt-get update
# Install Docker dependencies
sudo apt-get install -y ca-certificates curl git make

# Uninstall all conflicting packages
for pkg in docker.io docker-doc docker-compose podman-docker containerd runc
do
	sudo apt-get remove $pkg
done

# Add Docker's official GPG key:
sudo apt-get update
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/debian/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/debian \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt-get update

# Install Docker
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# Add user to Docker group
sudo usermod -aG docker echavez-
newgrp docker

# Enable Docker service
sudo systemctl enable docker
sudo systemctl start docker
echo "127.0.0.1	echavez-.42.fr" | sudo tee -a /etc/hosts

mkdir -p /home/echavez-/data/wordpress-data
mkdir -p /home/echavez-/data/mariadb-data
