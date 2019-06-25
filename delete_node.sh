#!/bin/bash
kubectl drain $(echo=$NODE) --delete-local-data --force --ignore-daemonsets
kubectl delete node $NODE
