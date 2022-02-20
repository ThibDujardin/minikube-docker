#!/bin/bash

# this part allow minikube to pull images 
minikube ssh -- sudo sed -i "/Network/aDNS=8.8.8.8" /etc/systemd/network/10-eth1.network
minikube ssh -- sudo sed -i "/Network/aDNS=8.8.8.8" /etc/systemd/network/20-dhcp.network
minikube ssh -- sudo systemctl restart systemd-networkd 
