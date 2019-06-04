#!/bin/bash

# install prerequisites
sudo apt-get update
suodapt-get -y install apt-transport-https ca-certificates curl software-properties-common

# install docker
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
# Add repository
sudo add-apt-repository -y "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
# Install latest stable docker stable version
sudo apt-get update
sudo apt-get -y install docker-ce

# install docker-compose
sudo curl -L "https://github.com/docker/compose/releases/download/1.23.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod a+x /usr/local/bin/docker-compose
# Enable & start docker
sudo systemctl enable docker
sudo systemctl start docker

# using without sudo
sudo usermod -a -G docker $USER
