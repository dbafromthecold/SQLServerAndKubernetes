# SQL Server & Kubernetes

---

## Andrew Pruski

### SQL Server DBA & Microsoft Data Platform MVP

@fa[twitter] @dbafromthecold <br>
@fa[envelope] dbafromthecold@gmail.com <br>
@fa[wordpress] www.dbafromthecold.com <br>
@fa[github] github.com/dbafromthecold

---

### Session Aim

---

### Kubernetes

<img src="assets/images/KubernetesLogo.png" style="float: right"/>

<br>
@size[0.9em](Open source orchestration engine) <br>
@size[0.9em](Designed by Google) <br>
@size[0.9em](Hosted by the Cloud Native Computing Foundation) <br>
@size[0.9em](Kubernetes v1.0 was released on July 21, 2015)

---

### Why though?

---

### Getting Started

Minikube<br>
Docker for Desktop<br>
Visual Studio Code

---

## Demo

---

### Master

<img src="assets/images/master-128.png" style="float: right"/>

Contains the components for controlling the cluster<br>
kube-apiserver<br>
etcd<br>
kube-scheduler<br>
kube-controller-manager<br>
cloud-controller-manager<br>

---

### Nodes

<img src="assets/images/node-128.png" style="float: right"/>

Responsible for runninga and maintaining pods<br>
kubelet<br>
kube-proxy<br>
Docker

---

### Pods

<img src="assets/images/master-128.png" style="float: right"/>

Group of one or more containers<br>
Shared storage/network<br>
Specification for how to run the containers

---

### Services

<img src="assets/images/svc-128.png" style="float: right"/>

An abstraction over a set of pods<br>
Provides a stable networking endpoint<br>
Different types: -<br>
ClusterIp<br>
NodePort<br>
LoadBalancer<br>
External Name

---

### Deployments

<img src="assets/images/deploy-128.png" style="float: right"/>

---

## Demo

---

## Persisting data

---

## Persistent Volumes

<img src="assets/images/pv-128.png" style="float: right"/>

---

## Persistent Volume Claims

<img src="assets/images/pvc-128.png" style="float: right"/>

---

## Demo

---

## Cloud Providers

Azure Kubernetes Service<br>
Amazon Elastic Container Service for Kubernetes<br>
Google Kubernetes Service

---

## Resources