# https://dbafromthecold.com/2019/01/16/deploying-sql-server-to-kubernetes-using-helm/



# switch context
kubectl config use-context raspberrypik8s



# confirm helm version
helm version



# search for Sql Server chart
helm search repo stable/mssql-linux



# perform test deployment
helm install sqlserver stable/mssql-linux --dry-run --debug



# list helm repos
helm repo list



# navigate to helm package location
cd /mnt/c/git/dbafromthecold/SQLServerAndKubernetes/Demos/RaspberryPi/Helm



# perform test deployment from private repo
helm install azuresqledge ./azuresqledge --version 0.1.0 --dry-run --debug



# deploy
helm install azuresqledge ./azuresqledge --version 0.1.0



# confirm deployment
helm list



# list deployments
kubectl get deployments



# list pods
kubectl get pods



# list services
kubectl get services



# clean up
helm delete azuresqledge