############################################################################
############################################################################
#
# SQL Server & Kubernetes - Andrew Pruski
# @dbafromthecold
# dbafromthecold@gmail.com
# https://github.com/dbafromthecold/SQLServerAndKubernetes
# https://github.com/lucky-sideburn/KubeInvaders 
# KubeInvaders
#
############################################################################
############################################################################



# confirm kubectl context
kubectl config current-context



# switch context to local cluster
kubectl config use-context kubeinvaders1



# test connection to cluster
kubectl get nodes



# navigate to yaml location
Set-Location C:\git\SQLServerAndKubernetes\yaml



# run pods
kubectl apply -f .\kubeinvaders.yaml



# get pods
kubectl get pods -o wide



# watch pods
kubectl get pods --watch



# clean up
kubectl delete deployment sqlserver