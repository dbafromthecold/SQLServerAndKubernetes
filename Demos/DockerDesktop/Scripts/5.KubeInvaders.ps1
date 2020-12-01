# https://dbafromthecold.com/2019/07/03/chaos-engineering-for-sql-server-running-on-aks-using-kubeinvaders/
# https://github.com/lucky-sideburn/KubeInvaders



# confirm kubectl context
kubectl config current-context



# switch context to local cluster
kubectl config use-context SQLK8sCluster1



# navigate to yaml location
cd C:\git\dbafromthecold\SQLServerAndKubernetes\Demos\DockerDesktop\Yaml



# run pods
kubectl apply -f .\kubeinvaders.yaml -n foobar



# get pods
kubectl get pods -o wide -n foobar



# watch pods
kubectl get pods -n foobar --watch



# clean up
kubectl delete deployment sqlserver -n foobar