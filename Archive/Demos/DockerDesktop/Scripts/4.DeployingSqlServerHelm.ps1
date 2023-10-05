# https://dbafromthecold.com/2019/01/16/deploying-sql-server-to-kubernetes-using-helm/


# switch context
kubectl config use-context docker-desktop



# confirm helm version
helm version



# list helm repos
helm repo list



# search for Sql Server chart
helm search repo stable/mssql-linux



# navigate to helm package location
cd C:\git\dbafromthecold\SQLServerAndKubernetes\Demos\DockerDesktop\Helm



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