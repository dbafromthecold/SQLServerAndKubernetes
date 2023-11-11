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



# navigate to helm package location
Set-Location C:\git\SQLServerAndKubernetes\Helm



# perform test deployment using local chart
helm install sqlserver .\sqlserver --version 0.1.0 --dry-run --debug



# deploy
helm install sqlserver .\sqlserver --version 0.1.0



# confirm deployment
helm list



# list deployments
kubectl get deployments



# list storage
kubectl get pv; kubectl get pvc



# list pods
kubectl get pods



# list secret
kubectl get secrets



# list services
kubectl get services



# connect to sql server
mssql-cli -S localhost -U sa -P Testing1122 -Q "SELECT @@VERSION AS [Version];"



# delete release
helm delete sqlserver



# package the chart
helm package ./sqlserver



# clone repository locally
git clone https://github.com/dbafromthecold/DemoHelmRepo.git C:\git\DemoHelmRepo



# move packaged chart to repo
Move-Item sqlserver-0.1.0.tgz C:\git\DemoHelmRepo



# navigate to repo
Set-Location C:\git\DemoHelmRepo



# index repo
helm repo index .



# view index.yaml
cat index.yaml



# push chart to Github
git add .
git commit -m "added sqlserver chart to repo"
git push



# add Githb repo as a Helm repository
helm repo add testrepo https://raw.githubusercontent.com/dbafromthecold/DemoHelmRepo/main



# view new Helm repository
helm repo list



# search new Helm repository
helm search repo testrepo/sqlserver



# deploy chart from repository
helm install testchart testrepo/sqlserver



# confirm deployment
helm list



# clean up demo repo
Remove-Item index.yaml; Remove-Item sqlserver-0.1.0.tgz
git add .
git commit -m "cleaned up repo"
git push



# clean up locally
helm delete testchart
helm repo remove testrepo
Set-Location ~; Remove-Item C:\git\DemoHelmRepo -Recurse -Force