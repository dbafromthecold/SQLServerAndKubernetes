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

## Getting Started

Minikube<br>
Docker for Desktop<br>
Minishift<br>
Micro k8s<br>

---

## Other tools

Visual Studio Code<br>
Kubectl

---

# Demo

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

Group of one or more containers<br>
Shared storage/network<br>
Specification for how to run the containers

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

---

## Deployments

<img src="assets/images/deploy-128.png" style="float: right"/>

Declarative rather than procedural<br>
Desired state defined<br>
Pushed to cluster via kubectl<br>
Desired state vs running state

---?code=assets/code/deployment_yaml_file.yaml&lang=yaml&title=Deployment yaml file

@[3-6](Metadata of deployment)
@[8](Number of replicas)
@[13-23](Pod declaration)
@[15](Pod name)
@[16](Image to be used)
@[17-18](Port on pod)
@[19-23](Setting environment variables)
@[24-35](Service)
@[26-27](Metadata)
@[29-32](Port on service to port on pod)
@[33-35](Selector)
@[35](External IP address)

---

# Demo

---

## Persisting data

Same issue with Docker containers<br>
Data changes not on a persistent volume will be lost

---

## Persistent Volumes

<img src="assets/images/pv-128.png" style="float: right"/>

Just a piece of storage in the cluster<br>
Described by storage classes<br>
Can be either dynamic or static

---

## Persistent Volume Claims

<img src="assets/images/pvc-128.png" style="float: right"/>

Request for storage by a user<br>
Request for size and access type<br>
PVC is attached to a pod

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
