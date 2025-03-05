############################################################################
############################################################################
#
# SQL Server & Kubernetes - Andrew Pruski
# @dbafromthecold
# dbafromthecold@gmail.com
# https://github.com/dbafromthecold/SQLServerAndKubernetes
# Kubernetes Basic Deployment
#
############################################################################
############################################################################



# switch context to local cluster
kubectl config use-context docker-desktop



# view nodes
kubectl get nodes



# deploy pod
kubectl run sqlserver `
--image=mcr.microsoft.com/mssql/server:2022-CU5-ubuntu-20.04 `
--env ACCEPT_EULA=Y --env MSSQL_SA_PASSWORD=Testing1122



# view pod
kubectl get pods



# exec into pod
$PODNAME=$(kubectl get pods --no-headers -o custom-columns=":metadata.name")
kubectl exec -it $PODNAME -- bash



# navigate to sqlcmd
cd /opt/mssql-tools/bin/



# connect to sql
./sqlcmd -S . -U sa -P Testing1122



# confirm sql version
SELECT @@VERSION;
GO



# exit SQL and pod
exit



# expose service
kubectl expose pod sqlserver --type=LoadBalancer --port=1433 --target-port=1433



# get service IP
kubectl get services



# connect via mssql-cli
mssql-cli -S localhost -U sa -P Testing1122 -Q "SELECT @@VERSION AS [Version];"



# clean up
kubectl delete pod sqlserver
kubectl delete service sqlserver