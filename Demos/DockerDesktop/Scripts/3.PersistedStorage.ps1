# https://dbafromthecold.com/2018/01/24/configuring-persistent-storage-for-sql-in-aks/



# confirm kubectl context
kubectl config current-context



# switch context to local cluster
kubectl config use-context docker-desktop



# navigate to script location
Set-Location C:\git\dbafromthecold\SQLServerAndKubernetes\Demos\DockerDesktop\Yaml



# view storage class yaml
Get-Content storageclass.yaml



# create storage class
kubectl apply -f storageclass.yaml



# view storage class
kubectl get sc



# view persistent volume claim yaml
Get-Content persistentvolumeclaim.yaml



# create persistent volume claim
kubectl apply -f persistentvolumeclaim.yaml



# view persistent volume claim
kubectl get pvc



# view persistent volume 
kubectl get pv



# describe persistent volume 
kubectl describe pv



# create secret
kubectl create secret generic mssql --from-literal=SA_PASSWORD="Testing1122"



# view secret
kubectl get secrets



# describe secret
kubectl describe secret mssql



# view sqlserver_persistentvolume.yaml file
Get-Content sqlserver_persistentvolume.yaml



# deploy sqlserver
kubectl apply -f sqlserver_persistentvolume.yaml



# view deployments
kubectl get deployments



# view pods
kubectl get pods



# view service
kubectl get service



# connect via mssql-cli
mssql-cli -S localhost -U sa -P Testing1122 -Q "SELECT @@VERSION AS [Version];"



# create a database
mssql-cli -S localhost -U sa -P Testing1122 -Q "CREATE DATABASE [testdatabase];"



# view databases
mssql-cli -S localhost -U sa -P Testing1122 -Q "SELECT [name] FROM sys.databases;"


# view database files
mssql-cli -S localhost -U sa -P Testing1122 -Q "USE [testdatabase]; EXEC sp_helpfile;"


# view pods with IP address
kubectl get pods -o wide



# delete pod
$PODNAME=$(kubectl get pods --no-headers -o custom-columns=":metadata.name")
kubectl delete pod $PODNAME



# view new pod's IP address
kubectl get pods -o wide



# view persistent volume claim
kubectl get pvc



# view volume
kubectl get pv



# view service
kubectl get service



# view databases
mssql-cli -S localhost -U sa -P Testing1122 -Q "SELECT [name] FROM sys.databases;"



# clean up
kubectl delete deployment sqlserver
kubectl delete service sqlserver-service
kubectl delete secret mssql
kubectl delete pvc mssql-data
kubectl delete sc test-sc
