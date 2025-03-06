############################################################################
############################################################################
#
# SQL Server & Kubernetes - Andrew Pruski
# @dbafromthecold
# dbafromthecold@gmail.com
# https://github.com/dbafromthecold/SQLServerAndKubernetes
# Deploying SQL Server to Kubernetes
#
############################################################################
############################################################################


############################################################################
############################################################################
#
# SQL Server & Kubernetes - Andrew Pruski
# @dbafromthecold
# dbafromthecold@gmail.com
# https://github.com/dbafromthecold/SQLServerAndKubernetes
# Deploying SQL Server to Kubernetes
#
############################################################################
############################################################################



# confirm kubectl context
kubectl config current-context



# switch context to correct cluster
kubectl config use-context CLUSTERNAME



# navigate to script location
Set-Location C:\git\SQLServerAndKubernetes\yaml



# view sql yaml file - FIX
Get-Content mssql-statefulset.yaml | code -



# deploy to cluster
kubectl apply -f mssql-statefulset.yaml



# view cluster events
kubectl get events --sort-by=.metadata.creationTimestamp



# view deployment
kubectl get statefulsets



# view pods
kubectl get pods



# get more info on pods
kubectl get pods -o wide



# describe pods
kubectl describe pods



# view sql processes with pod
kubectl exec PODNAME -- ps aux



# view environment variables within pod
kubectl exec PODNAME -- printenv



# decrypt sa password in kubernetes
TBD



# deploy load balanced service - TO DO!!!!!!!!!!!!
kubectl apply -f mssql-service.yaml



# view service
kubectl get service



# connect via mssql-cli
mssql-cli -S localhost -U sa -P Testing1122 -Q "SELECT @@VERSION AS [Version];"



# create a database
mssql-cli -S localhost -U sa -P Testing1122 -Q "CREATE DATABASE [testdatabase];"



# view databases
mssql-cli -S localhost -U sa -P Testing1122 -Q "SELECT [name] FROM sys.databases;"



# view location of database files
mssql-cli -S localhost -U sa -P Testing1122 -Q "USE [testdatabase]; EXEC sp_helpfile;"



# get pods
kubectl get pods -o wide



# delete pod
$PODNAME=$(kubectl get pods --no-headers -o custom-columns=":metadata.name")
kubectl delete pod $PODNAME



# view pods
kubectl get pods -o wide



# get service
kubectl get service



# view databases
mssql-cli -S localhost -U sa -P Testing1122 -Q "SELECT [name] FROM sys.databases;"



# clean up
kubectl delete statefulset mssql-statefulset
kubectl delete service mssql-service