# https://dbafromthecold.com/2019/01/16/deploying-sql-server-to-kubernetes-using-helm/


# switch context
kubectl config use-context docker-desktop



# confirm helm version
helm version



# search for Sql Server chart
helm search repo stable/mssql-linux



# perform test deployment
helm install sqlserver stable/mssql-linux --dry-run --debug



# list helm repos
helm repo list



# search for chart in private repo
helm search repo dbafromthecold/sqlserver2019cu4



# perform test deployment from private repo
helm install sqlserver2019 dbafromthecold/sqlserver2019cu4 --version 0.1.0 --dry-run --debug



# deploy
helm install sqlserver2019 dbafromthecold/sqlserver2019cu4 --version 0.1.0



# confirm deployment
helm list



# list deployments
kubectl get deployments



# list pods
kubectl get pods



# list services
kubectl get services



# clean up
helm delete sqlserver2019