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

To give you background knowledge (and code) to get started with Kubernetes

---

## What is Kubernetes?

@quote[Kubernetes is a portable, extensible open-source platform for managing containerized workloads and services, that facilitates both declarative configuration and automation. It has a large, rapidly growing ecosystem. Kubernetes services, support, and tools are widely available](kubernetes.io)

---

## Kubernetes

<img src="assets/images/KubernetesLogo.png" style="float: right"/>

<br>
@size[0.9em](Open source orchestration engine) <br>
@size[0.9em](Designed by Google) <br>
@size[0.9em](Hosted by the Cloud Native Computing Foundation) <br>
@size[0.9em](Kubernetes v1.0 was released on July 21, 2015)

---

<p align="center">
  <img src="assets/images/ytho.png" />
</p>

---

## Why learn Kubernetes?

Leading orchestrator<br>
Easy to deploy and mantain containers<br>
Quick to spin up containers<br>
High availability built-in<br>
Big Data Clusters

---

# Getting Started

---

## Running Kubernetes locally

Minikube<br>
Docker for Desktop<br>
Minishift<br>
Micro k8s<br>

---

## Other tools

Visual Studio Code<br>
Kubectl<br>
kube-shell

---

# Demo

---

# Deploying to a remote cluster

---

## Master

<img src="assets/images/master-128.png" style="float: right"/>

Components for controlling the cluster<br>

@ul
- @size[0.9em](kube-apiserver)<br>
- @size[0.9em](etcd)<br>
- @size[0.9em](kube-scheduler)<br>
- @size[0.9em](kube-controller-manager)<br>
- @size[0.9em](cloud-controller-manager)<br>
@ulend

---

## Nodes

<img src="assets/images/node-128.png" style="float: right"/>

Running and maintaining pods<br>

@ul
- @size[0.9em](kubelet)<br>
- @size[0.9em](kube-proxy)<br>
- @size[0.9em](Docker)
@ulend

---

## Pods

<img src="assets/images/master-128.png" style="float: right"/>

Smallest deployable units of computing<br>
Group of one or more containers<br>
Shared storage/network<br>
Holds specifications of containers

---

## Services

<img src="assets/images/svc-128.png" style="float: right"/>

An abstraction over a set of pods<br>
Provides a stable networking endpoint<br>
Different types: -<br>

@ul
- @size[0.9em](ClusterIp)<br>
- @size[0.9em](NodePort)<br>
- @size[0.9em](LoadBalancer)<br>
- @size[0.9em](External Name)
@ul

---?code=assets/code/deployment_yaml_file.yaml&lang=yaml&title=Example yaml file

@[3-4](Metadata of deployment)
@[6](Number of replicas)
@[11-21](Pod declaration)
@[13](Pod name)
@[14](Image to be used)
@[15-16](Port)
@[17-21](Setting environment variables)
@[22-35](Service)
@[24-25](Metadata)
@[27-30](Port on service to port on pod)
@[31-33](External IP address)

---

# Demo

---

# Persisting data

---

## Persisting data

Same issue with Docker containers<br>
Data changes not on a persistent volume will be lost

---

## Persistent Volumes

<img src="assets/images/pv-128.png" style="float: right"/>

Just a piece of storage in the cluster<br>
Lifecycle independent of the pods<br>
Can be either dynamic or static

---

## Persistent Volume Claims

<img src="assets/images/pvc-128.png" style="float: right"/>

Request for storage by a user<br>
Request for size and access type<br>
PVC is attached to a pod

---?code=assets/code/persistentvolumeclaim.yaml&lang=yaml&title=Persistent Volume yaml file

@[1-8](Create storage class)
@[10-20](Define persistent volume claim)

---?code=assets/code/sqlserver_pvc.yaml&lang=yaml&title=Using Persistent Volume Claims

@[25-31](Reference to PVC)

---

# Demo

---

## Cloud Providers

Azure Kubernetes Service<br>
Amazon Elastic Container Service for Kubernetes<br>
Google Kubernetes Service<br>
IBM Kubernetes Service

---

## Resources

https://github.com/dbafromthecold/SQLServerAndKubernetes<br>
https://dbafromthecold.com/2017/03/15/summary-of-my-container-series/
