# https://dbafromthecold.com/2017/11/15/running-sql-server-in-kubernetes-on-azure-container-services-aks-ii/



# confirm kubectl context
kubectl config current-context



# switch context to local cluster
kubectl config use-context raspberrypik8s



# navigate to script location
cd /mnt/c/git/dbafromthecold/SQLServerAndKubernetes/Demos/RaspberryPi/Yaml



# view sql yaml file
cat azuresqledge.yaml



# deploy to cluster
kubectl apply -f azuresqledge.yaml



# view deployment
kubectl get deployments



# view pods
kubectl get pods



# get more info on pods
kubectl get pods -o wide



# describe pods
kubectl describe pods



# view service
kubectl get service --show-labels



# get service IP
IP=$(kubectl get services --no-headers -l app=azuresqledge -o custom-columns=":status.loadBalancer.ingress[*].ip") && echo $IP



# create database
mssql-cli -S $IP -U sa -P Testing1122 -Q "CREATE DATABASE [testdatabase];"



# confirm database
mssql-cli -S $IP -U sa -P Testing1122 -Q "SELECT [name] FROM sys.databases;"



# view database files
mssql-cli -S $IP -U sa -P Testing1122 -Q "USE [testdatabase]; EXEC sp_helpfile;"



# get pods
kubectl get pods -o wide



# delete pod
PODNAME=$(kubectl get pods --no-headers -o custom-columns=":metadata.name")
kubectl delete pod $PODNAME



# view pods
kubectl get pods -o wide



# get service
kubectl get service



# check database is there
mssql-cli -S $IP -U sa -P Testing1122 -Q "SELECT [name] FROM sys.databases;"



# clean up
kubectl delete deployment azuresqledge
kubectl delete service azuresqledge-service