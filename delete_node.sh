#!/bin/bash
kubectl drain $NODE --delete-local-data --force --ignore-daemonsets
kubectl delete node $NOE
