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



# list helm repos
helm repo list



# navigate to helm package location
Set-Location C:\git\SQLServerAndKubernetes\Helm



# perform test deployment from private repo
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



# list services
kubectl get services



# clean up
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
git commit -am "added sqlserver chart to repo"; git push



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



# clean up
helm delete sqlserver
helm repo remove testrepo
Set-Location ~; Remove-Item C:\git\DemoHelmRepo -Recurse -Force