#!/bin/bash

sudo sed -i '' "/minikube/d" /etc/hosts
echo -e "$(minikube ip)\tminikube.local" | sudo tee -a /etc/hosts
