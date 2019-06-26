#!/bin/bash

echo "installing kubernetes"
apt-get update && apt-get install -y apt-transport-https curl
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
cat <<EOF >/etc/apt/sources.list.d/kubernetes.list
 deb https://apt.kubernetes.io/ kubernetes-xenial main
EOF
apt-get update
apt-get install -y kubelet kubeadm kubectl
apt-mark hold kubelet kubeadm kubectl
#kubeadm init --pod-network-cidr=10.244.0.0/16 # --apiserver-advertise-address="ip" if you want to use a different IP address than the main server IP

#for hosted solution
kubeadm init --pod-network-cidr=192.168.0.0/16 

echo "cluster initialized"
sleep 2
# make kubeadm run as non root user
mkdir -p $HOME/.kube
cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
chown $(id -u):$(id -g) $HOME/.kube/config
sleep 2
echo "deploying pod netword"

#kubectl apply -f https://raw.githubusercontent.com/coreos/flannel/master/Documentation/kube-flannel.yml
#for hosted solution
kubectl apply -f https://docs.projectcalico.org/v3.3/getting-started/kubernetes/installation/hosted/rbac-kdd.yaml
kubectl apply -f https://docs.projectcalico.org/v3.3/getting-started/kubernetes/installation/hosted/kubernetes-datastore/calico-networking/1.7/calico.yaml

echo "cluster initialized"
kubectl get pods --all-namespaces

#
#
