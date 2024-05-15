#!/bin/bash

# Check if Docker is already installed
if command -v docker &>/dev/null; then
    echo "Docker is already installed."
else
    # Install Docker dependencies
    echo "Installing Docker dependencies..."
    sudo apt-get update
    sudo apt-get install -y apt-transport-https ca-certificates curl gnupg lsb-release

    # Install Docker
    echo "Installing Docker..."
    curl -fsSL https://get.docker.com -o get-docker.sh
    sudo sh get-docker.sh

    # Add current user to the docker group
    sudo usermod -aG docker $USER

    # Start Docker service
    sudo systemctl start docker
    sudo systemctl enable docker

    echo "Docker has been installed successfully."
fi

# Check if Docker Compose is already installed
if command -v docker-compose &>/dev/null; then
    echo "Docker Compose is already installed."
else
    # Install Docker Compose
    echo "Installing Docker Compose..."
    apt install docker-compose -y
    echo "Docker Compose has been installed successfully."
fi

