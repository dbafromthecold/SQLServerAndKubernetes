############################################################################
############################################################################
#
# SQL Server & Kubernetes - Andrew Pruski
# @dbafromthecold
# dbafromthecold@gmail.com
# https://github.com/dbafromthecold/SQLServerAndKubernetes
# Helm
#
############################################################################
############################################################################



# switch context
kubectl config use-context docker-desktop



# confirm helm version
helm version



# list helm repos
helm repo list



# navigate to helm package location
cd C:\git\SQLServerAndKubernetes\\Helm



# perform test deployment from private repo
helm install sqlserver .\sqlserver --version 0.1.0 --dry-run --debug



# deploy
helm install sqlserver .\sqlserver --version 0.1.0



# confirm deployment
helm list



# list deployments
kubectl get deployments



# list pods
kubectl get pods



# list services
kubectl get services



# clean up
helm delete sqlserver