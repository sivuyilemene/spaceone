#!/bin/bash


# 1. Install Docker Engine using apt repo

# 1a  Set up Docker's apt repository.

# Add Docker's official GPG key:
sudo apt-get update 
sudo apt-get install ca-certificates curl 
install -m 0755 -d /etc/apt/keyrings 
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update

# 1b.  Install the Docker packages
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y

#1c Add your user to the 'docker' group: 
sudo usermod -aG docker $USER && newgrp docker

# 1d. Verify Docker Engine is installed
docker --version


# 2. Install Minikube
# 2a Download and install minikube
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo install minikube-linux-amd64 /usr/local/bin/minikube && rm minikube-linux-amd64

# 2b Verify minikube is installed
minikube version


# 3. Install Kubectl
# 3a Install kubectl binary with curl on Linux 
   curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"

# 3b Validate the binary (optional)
# Download the kubectl checksum file:
  curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl.sha256"

# Validate the kubectl binary against the checksum file:
echo "$(cat kubectl.sha256)  kubectl" | sha256sum --check

# If valid, the output is:
#kubectl: OK

# If the check fails, sha256 exits with nonzero status and prints output similar to:
# kubectl: FAILED
# sha256sum: WARNING: 1 computed checksum did NOT match

# 3c Install Kubectl
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

# Test to ensure the version you installed is up-to-date:
kubectl version --client



#4. Install Helm
curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
chmod 700 get_helm.sh
./get_helm.sh

# verify helm is installed
helm version


#5. install aws cli
sudo snap install aws-cli --classic

