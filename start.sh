#!/bin/bash

minikube start --driver=docker --memory=5000mb

# 1) Download Helm Chart Repository 


# Set working directory
mkdir cloudforet-deployment
cd cloudforet-deployment
wget https://github.com/cloudforet-io/charts/releases/download/spaceone-1.12.12/spaceone-1.12.12.tgz
tar zxvf spaceone-1.12.12.tgz

# 2) Create Namespaces 
kubectl create ns cloudforet
kubectl create ns cloudforet-plugin

# 3) Create Role and RoleBinding 
wget https://raw.githubusercontent.com/cloudforet-io/charts/master/examples/rbac.yaml -O rbac.yaml
kubectl apply -f rbac.yaml -n cloudforet-plugin

# 4) Install Cloudforet Chart 
wget https://raw.githubusercontent.com/cloudforet-io/charts/master/examples/values/release-1-12.yaml -O release-1-12.yaml
helm install cloudforet spaceone -n cloudforet -f release-1-12.yaml


# get pods status
kubectl get pod -n cloudforet


# 5) Initialize the Configuration 
wget https://raw.githubusercontent.com/cloudforet-io/charts/master/examples/initializer.yaml -O initializer.yaml
wget https://github.com/cloudforet-io/charts/releases/download/spaceone-initializer-1.3.3/spaceone-initializer-1.3.3.tgz
tar zxvf spaceone-initializer-1.3.3.tgz
helm install initializer spaceone-initializer -n cloudforet -f initializer.yaml

# 6) Set the Helm Values and Upgrade the Chart 
kubectl get pods -n cloudforet 

# Get the token by getting the log information of the pod with the name you found above.
kubectl logs initialize-spaceone- -n cloudforet

# Update your helm values file (ex. release-1-12.yaml) and edit the values. There is only one item that need to be updated.

