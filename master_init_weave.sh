#!/bin/bash

sudo kubeadm init --kubernetes-version v1.15.0 --apiserver-advertise-address="your ip"
sudo cp /etc/kubernetes/admin.conf $HOME/
sudo chown $(id -u):$(id -g) $HOME/admin.conf
export KUBECONFIG=$HOME/admin.conf

kubectl apply -f "https://cloud.weave.works/k8s/net?k8s-version=$(kubectl version | base64 | tr -d '\n')"

kubectl get pods --all-namespaces

kubectl taint nodes --all node-role.kubernetes.io/master-

sudo ufw allow 6763/tcp
sudo ufw allow 6763/udp
sudo ufw allow 6764/udp
sudo ufw allow 6781/tcp
sudo ufw allow 6782/tcp
