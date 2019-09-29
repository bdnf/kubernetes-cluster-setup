# Set of scripts to setup K8s Cluster


## Untaint Master node to allow placement of Pods
kubectl taint nodes $(hostname) node-role.kubernetes.io/master:NoSchedule-

## Taint Master node to disallow placement
kubectl taint nodes $(hostname) node-role.kubernetes.io/master:NoSchedule=true

