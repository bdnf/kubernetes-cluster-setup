#!/bin/bash
export MASTER=
kubectl drain $MASTER --delete-local-data --force --ignore-daemonsets
kubectl delete node $MASTER
kubeadm reset


