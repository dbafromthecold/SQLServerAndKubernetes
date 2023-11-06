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



# navigate to yaml location
cd C:\git\SQLServerAndKubernetes\yaml



# run pods
kubectl apply -f .\kubeinvaders.yaml



# get pods
kubectl get pods -o wide 



# watch pods
kubectl get pods -n foobar --watch



# clean up
kubectl delete deployment sqlserver