# https://dbafromthecold.com/2018/02/07/sql-server-in-kubernetes-on-docker-for-windows/



# get tags for SQL Server
(invoke-webrequest https://mcr.microsoft.com/v2/mssql/server/tags/list -UseBasicParsing).content



# get tags for Azure SQL Edge
(invoke-webrequest https://mcr.microsoft.com/v2/azure-sql-edge/tags/list -UseBasicParsing).content



# switch to WSL 2
ubuntu



# confirm kubectl context
kubectl config current-context



# switch context to local cluster
kubectl config use-context raspberrypik8s



# view nodes
kubectl get nodes



# deploy pod
kubectl run azuresqledge \
--image=mcr.microsoft.com/azure-sql-edge:latest \
--env ACCEPT_EULA=Y --env SA_PASSWORD=Testing1122
 


# view pod
kubectl get pods



# check sql is running
PODNAME=$(kubectl get pods --no-headers -o custom-columns=":metadata.name")
kubectl exec -it $PODNAME -- ps -auxw



# expose service
kubectl expose pod azuresqledge -l app=azuresqledge --type=LoadBalancer --port=1433 --target-port=1433



# show service
kubectl get services



# get service IP
IP=$(kubectl get services --no-headers -l app=azuresqledge -o custom-columns=":status.loadBalancer.ingress[*].ip") && echo $IP



# confirm SQL Server version
mssql-cli -S $IP -U sa -P Testing1122 -Q "SELECT @@VERSION AS [Version];"



# clean up
kubectl delete service azuresqledge
kubectl delete pod azuresqledge
