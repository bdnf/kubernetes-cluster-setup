#!/bin/bash

sudo kubeadm init --kubernetes-version v1.15.3 --pod-network-cidr=10.244.0.0/16 --apiserver-advertise-address="your ip"
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
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
sudo ufw allow 6783/tcp
sudo ufw allow 6783/udp
sudo ufw allow 6784/tcp
sudo ufw allow 6784/udp

#Kubeadm master 
sudo ufw allow 6443,2379,2380,10250,10251,10252,10255/tcp

#Nodes
sudo ufw allow 10250,10255,30000:32767/tcp
sudo ufw allow 6784/tcp
sudo ufw allow 6784/udp
