#!/bin/sh

set -e

# Build docker image
docker build . --tag arca-webserver:latest

# Apply kubernetes deployment file
kubectl apply -f kubernetes/deployment.yml

# Start minikube service for arca-webserver
minikube service arca-webserver-service

# Enable minikube ingress addon
minikube addons enable ingress

# Apply kubernetes ingress file
kubectl apply -f kubernetes/ingress.yml
