# SQL Server & Kubernetes

---

## Andrew Pruski

### SQL Server DBA, Microsoft Data Platform MVP, & Certified Kubernetes Administrator
<!-- .slide: style="text-align: left;"> -->
<i class="fab fa-twitter"></i><a href="https://twitter.com/dbafromthecold">  @dbafromthecold</a><br>
<i class="fas fa-envelope"></i>  dbafromthecold@gmail.com<br>
<i class="fab fa-wordpress"></i>  www.dbafromthecold.com<br>
<i class="fab fa-github"></i><a href="https://github.com/dbafromthecold">  github.com/dbafromthecold.com</a>

---

## Session Aim
<!-- .slide: style="text-align: left;"> -->
To give you background knowledge (and code) to get started with Kubernetes

---

## What is Kubernetes?

"Kubernetes is a portable, extensible open-source platform for managing containerized workloads and services, that facilitates both declarative configuration and automation. It has a large, rapidly growing ecosystem. Kubernetes services, support, and tools are widely available"<br>
<font size="6"><a href="https://kubernetes.io/">kubernetes.io</a></font>

---

## Kubernetes

<img src="images/KubernetesLogo.png" style="float: right"/>
<!-- .slide: style="text-align: left;"> -->
<br>
<font size=6>
Open source orchestration engine<br>
Designed by Google <br>
Cloud Native Computing Foundation <br>
v1.0 was released on July 21, 2015
</font>
---

<p align="center">
  <img src="images/ytho.png" />
</p>

---

## Why learn Kubernetes?
<!-- .slide: style="text-align: left;"> -->
Leading orchestrator<br>
Easy to deploy and mantain containers<br>
Quick to spin up containers<br>
High availability built-in<br>
Big Data Clusters

---

# Getting Started

---

## Running Kubernetes locally
<!-- .slide: style="text-align: left;"> -->
Minikube<br>
Docker for Desktop<br>
Microk8s<br>
k3s<br>
RaspberryPi


---

## Other tools
<!-- .slide: style="text-align: left;"> -->
Visual Studio Code<br>
Azure Data Studio/SSMS<br>
Kubectl<br>
mssql-cli

---

# Demo

---

# Kubernetes components

---

## Control node
<!-- .slide: style="text-align: left;"> -->
<img src="images/control-128.png" style="float: right"/>

Components for controlling the cluster<br>
- kube-apiserver<br>
- etcd<br>
- kube-scheduler<br>
- kube-controller-manager<br>
- cloud-controller-manager<br>

---

## Worker Nodes
<!-- .slide: style="text-align: left;"> -->
<img src="images/node-128.png" style="float: right"/>

Running and maintaining pods<br>

- kubelet<br>
- kube-proxy<br>
- Docker

---

## Pods
<!-- .slide: style="text-align: left;"> -->
<img src="images/control-128.png" style="float: right"/>

Smallest deployable units of computing<br>
Group of one or more containers<br>
Shared storage/network<br>
Holds specifications of containers

---

## Services
<!-- .slide: style="text-align: left;"> -->
<img src="images/svc-128.png" style="float: right"/>

An abstraction over a set of pods<br>
Provides a stable networking endpoint<br>
Different types:- <br>

- ClusterIP<br>
- NodePort<br>
- LoadBalancer<br>
- External Name

---

## Example Yaml File

<pre><code data-line-numbers="3-4|6|14-24|16|17|18-19|20-24|26-37|28-29|31-34|35-36|37">apiVersion: apps/v1
kind: Deployment
metadata:
  name: sqlserver
spec:
  replicas: 1
  selector:
    matchLabels:
      name: sqlserver
  template:
    metadata:
      labels:
        name: sqlserver
    spec:
      containers:
      - name: sqlserver1
        image: mcr.microsoft.com/mssql/server:2019-CU4-ubuntu-16.04
        ports:
        - containerPort: 1433
        env:
        - name: SA_PASSWORD
          value: "Testing1122"
        - name: ACCEPT_EULA
          value: "Y"
---
apiVersion: v1
  kind: Service
metadata:
  name: sqlserver-service
spec:
  ports:
    name: sqlserver
    port: 1433
    targetPort: 1433
  selector:
    name: sqlserver
    type: LoadBalancer
</pre></code>

---

# Demo

---

# Persisting data

---

## Persisting data
<!-- .slide: style="text-align: left;"> -->
Same issue with Docker containers<br>
Data changes not on a persistent volume will be lost

---

## Persistent Volumes
<!-- .slide: style="text-align: left;"> -->
<img src="images/pv-128.png" style="float: right"/>

Just a piece of storage in the cluster<br>
Lifecycle independent of the pods<br>
Can be either dynamic or static

---

## Persistent Volume Claims
<!-- .slide: style="text-align: left;"> -->
<img src="images/pvc-128.png" style="float: right"/>

Request for storage by a user<br>
Request for size and access type<br>
Pods reference Persistent Volume Claims

---

## Creating Persistent Volume Claims

<pre><code data-line-numbers="1-8|10-20">apiVersion: storage.k8s.io/v1beta1
kind: StorageClass
metadata:
     name: azure-disk
provisioner: kubernetes.io/azure-disk
parameters:
  storageaccounttype: Standard_LRS
  kind: Managed
---
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: mssql-data
spec:
  accessModes:
    - ReadWriteOnce
  storageClassName: azure-disk
  resources:
    requests:
      storage: 1Gi
</pre></code>

---

## Create Secret

<pre><code data-line-numbers="1-2">kubectl create secret generic mssql \
--from-literal=SA_PASSWORD="Testing1122"</pre></code>

---

## Using Persistent Volume Claims

<pre><code data-line-numbers="24-27|28-34">apiVersion: apps/v1
kind: Deployment
metadata:
  name: sqlserver
spec:
  replicas: 1
  selector:
    matchLabels:
      name: sqlserver
  template:
    metadata:
      labels:
        name: sqlserver
    spec:
      containers:
      - name: sqlserver
        image: mcr.microsoft.com/mssql/server:2019-CU4-ubuntu-16.04
        ports:
        - containerPort: 1433
        env:
        - name: ACCEPT_EULA
          value: "Y"
        - name: SA_PASSWORD
          valueFrom:
            secretKeyRef:
              name: mssql
              key: SA_PASSWORD 
        volumeMounts:
        - name: mssqldb
          mountPath: /var/opt/mssql
      volumes:
      - name: mssqldb
        persistentVolumeClaim:
          claimName: mssql-data
</pre></code>

---

# Demo

---

# A package manager for Kubernetes

---

## Helm
<!-- .slide: style="text-align: left;"> -->
<img src="images/Helm.png" style="float: right"/>

Package manager for Kubernetes<br>
SQL Server available in the Helm Hub<br>
https://hub.helm.sh/

---

# Demo

---

# Chaos Engineering

---

## KubeInvaders

<img src="images/KubeInvaders_75.png" style="float: center"/>

---

# Demo

---

## Resources
<!-- .slide: style="text-align: left;"> -->
<font size="6">http://tinyurl.com/yyz8fe9x/SQLServerAndKubernetes<br>
http://tinyurl.com/y3x29t3j/summary-of-my-container-series/
https://github.com/lucky-sideburn/KubeInvaders</font>

<p align="center">
  <img src="images/SqlServerAndKubernetesQr.png" />
</p>

