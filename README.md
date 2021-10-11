# README

The webserver is written in **Ruby 3.0.1** and **Rails 6.1.4**.

The application can be started using the command:

    rails server

Also, the tests can be run using the following command:

    rails test

However, these commands are all packaged into the `docker-entrypoint.sh` file.

You can build the image using the command:

    docker build . --tag arca-webserver:latest

The kubernetes manifests are found in the following directory `kubernetes`.
This directory contains the deployment file and ingress file.

You can apply kubernetes deployment file using the following command:

    kubectl apply -f kubernetes/deployment.yml

You can start the minikube service for arca-webserver using the following command:

    minikube service arca-webserver-service

You can enable the minikube ingress addon for arca-webserver using the following command:

    minikube addons enable ingress

You can apply the kubernetes ingress file using the following command:

    kubectl apply -f kubernetes/ingress.yml

These steps can be automated by running the `build_deploy.sh` script:

    sh build_deploy.sh

This script takes care of building, packaging and deploying the application, and
configuring your minikube cluster. (You can assume minikube is already installed.)
