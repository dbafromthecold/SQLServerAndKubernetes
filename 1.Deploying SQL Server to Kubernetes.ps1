############################################################################
############################################################################
#
# SQL Server & Kubernetes - Andrew Pruski
# @dbafromthecold.com
# dbafromthecold@gmail.com
# https://github.com/dbafromthecold/SQLServerAndKubernetes
# Deploying SQL Server to Kubernetes
#
############################################################################
############################################################################



# confirm kubectl context
kubectl config current-context



# switch context to correct cluster
kubectl config use-context docker-desktop



# confirm connection to cluster
kubectl get nodes



# navigate to script location
cd /mnt/c/git/SQLServerAndKubernetes/yaml



# view mssql-secret yaml file
cat mssql-secret.yaml | code -



# create secret
kubectl apply -f mssql-secret.yaml



# view secret
kubectl get secret mssql-sa-password -o yaml



# decrypt sa password in kubernetes
PASSWD=$(kubectl get secret mssql-sa-password --no-headers -o custom-columns=":data.MSSQL_SA_PASSWORD")
echo $PASSWD | base64 --decode - && echo ""



# view mssql-statefulset yaml file
cat mssql-statefulset.yaml | code -



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



# view QoS
# https://kubernetes.io/docs/concepts/workloads/pods/pod-qos/
kubectl describe pods | grep QoS



# get pv and pvc - watch the reclaim policy!
kubectl get pv
kubectl get pvc



# view sql processes with pod
PODNAME=$(kubectl get pods --no-headers -o custom-columns=":metadata.name")
kubectl exec $PODNAME -- ps aux



# view environment variables within pod
PODNAME=$(kubectl get pods --no-headers -o custom-columns=":metadata.name")
kubectl exec $PODNAME -- printenv



# view mssq-service yaml
cat mssql-service.yaml | code -



# deploy load balanced service
kubectl apply -f mssql-service.yaml



# view service
kubectl get service



# connect via mssql-cli
mssql-cli -S localhost,15789 -U sa -P Testing1122 -Q "SELECT @@VERSION AS [Version];"



# create a database
mssql-cli -S localhost,15789 -U sa -P Testing1122 -Q "CREATE DATABASE [testdatabase];"



# view databases
mssql-cli -S localhost,15789 -U sa -P Testing1122 -Q "SELECT [name] FROM sys.databases;"



# view location of database files
mssql-cli -S localhost,15789 -U sa -P Testing1122 -Q "USE [testdatabase]; EXEC sp_helpfile;"



# get pods
kubectl get pods -o wide



# delete pod
PODNAME=$(kubectl get pods --no-headers -o custom-columns=":metadata.name")
kubectl delete pod $PODNAME



# view pods
kubectl get pods -o wide



# view databases
mssql-cli -S localhost,15789 -U sa -P Testing1122 -Q "SELECT [name] FROM sys.databases;"



# clean up
kubectl delete statefulset mssql-statefulset
kubectl delete service mssql-service
kubectl delete secret mssql-sa-password
kubectl delete pvc --all
kubectl delete pv --all