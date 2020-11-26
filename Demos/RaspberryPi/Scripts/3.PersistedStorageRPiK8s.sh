# https://dbafromthecold.com/2018/01/24/configuring-persistent-storage-for-sql-in-aks/



# confirm kubectl context
kubectl config current-context



# switch context to local cluster
kubectl config use-context raspberrypik8s



# navigate to script location
cd /mnt/c/git/dbafromthecold/SQLServerAndKubernetes/Demos/RaspberryPi/Yaml



# view persistent volume yaml
cat persistentvolume_raspberrypi.yaml



# create persistent volume
kubectl apply -f persistentvolume_raspberrypi.yaml



# view persistent volume
kubectl get pv



# view persistent volume claim yaml
cat persistentvolumeclaim_raspberrypi.yaml



# create persistent volume claim
kubectl apply -f persistentvolumeclaim_raspberrypi.yaml



# view persistent volume claim
kubectl get pvc



# view persistent volume 
kubectl get pv



# create secret
kubectl create secret generic mssql --from-literal=SA_PASSWORD="Testing1122"



# view secret
kubectl get secrets



# describe secret
kubectl describe secret mssql



# deploy sqlserver
kubectl apply -f azuresqledge_persistent.yaml



# view deployments
kubectl get deployments



# view pods
kubectl get pods



# view service
kubectl get service



# get service IP
IP=$(kubectl get services --no-headers -l app=azuresqledge -o custom-columns=":status.loadBalancer.ingress[*].ip") && echo $IP



# create database
mssql-cli -S $IP -U sa -P Testing1122 -Q "CREATE DATABASE [testdatabase];"



# confirm database
mssql-cli -S $IP -U sa -P Testing1122 -Q "SELECT [name] FROM sys.databases;"



# view database files
mssql-cli -S $IP -U sa -P Testing1122 -Q "USE [testdatabase]; EXEC sp_helpfile;"



# view pods with IP address
kubectl get pods -o wide



# delete pod
PODNAME=$(kubectl get pods --no-headers -o custom-columns=":metadata.name")
kubectl delete pod $PODNAME



# view new pod's IP address
kubectl get pods -o wide



# view persistent volume claim
kubectl get pvc



# view volume
kubectl get pv



# view service
kubectl get service



# check database is there
mssql-cli -S $IP -U sa -P Testing1122 -Q "SELECT [name] FROM sys.databases;"



# clean up
kubectl delete deployment azuresqledge
kubectl delete service azuresqledge-service
kubectl delete secret mssql
kubectl delete pvc sqlsystem-demo-pvc
kubectl delete pv sqlsystem-demo-pv
