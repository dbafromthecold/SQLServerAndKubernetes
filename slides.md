# SQL Server & Kubernetes

---

## Andrew Pruski

<img src="images/apruski.jpg" style="float: right"/>

### Principal Field Solutions Architect
### Microsoft Data Platform MVP
### Docker Captain
### VMware vExpert

<!-- .slide: style="text-align: left;"> -->
<i class="fa-brands fa-bluesky"></i><a href="https://bsky.app/profile/dbafromthecold.com">  @dbafromthecold.com</a><br>
<i class="fas fa-envelope"></i>  dbafromthecold@gmail.com<br>
<i class="fab fa-wordpress"></i>  www.dbafromthecold.com<br>
<i class="fab fa-github"></i><a href="https://github.com/dbafromthecold">  github.com/dbafromthecold</a>

---

## Session Aim
<!-- .slide: style="text-align: left;"> -->
To give you background knowledge (and code) to run SQL Server on Kubernetes

---

<p align="center">
  <img src="images/ytho.png" />
</p>

---

# Background

---

## Challenges for stateful applications
<!-- .slide: style="text-align: left;"> -->
TBD

---

## Why run SQL Server on Kubernetes?
<!-- .slide: style="text-align: left;"> -->
TBD

---

## SQL Server on Linux
<!-- .slide: style="text-align: left;"> -->
TBD

---

## Deployments vs Statefulsets
<!-- .slide: style="text-align: left;"> -->
TBD

---

### Persisting data
<!-- .slide: style="text-align: left;"> -->
TBD

---

### Access Modes
<!-- .slide: style="text-align: left;"> -->
TBD

---

### Storage Classes
<!-- .slide: style="text-align: left;"> -->
TBD

---

### SA Password
<!-- .slide: style="text-align: left;"> -->
TDB

---

## Example Statefulset
<!-- .slide: style="text-align: left;"> -->

<pre><code data-line-numbers="17-18|21|22-24|25-33|34-40|41-47|49-57|52-53|57">apiVersion: apps/v1
kind: StatefulSet
metadata:
  name: mssql-statefulset
spec:
  serviceName: "mssql"
  replicas: 1
  podManagementPolicy: Parallel
  selector:
    matchLabels:
      name: mssql-pod
  template:
    metadata:
      labels:
        name: mssql-pod
    spec:
      securityContext:
        fsGroup: 10001
      containers:
        - name: mssql-container
          image: mcr.microsoft.com/mssql/server:2022-CU16-ubuntu-20.04
          ports:
            - containerPort: 1433
              name: mssql-port
          env:
            - name: MSSQL_PID
              value: "Developer"
            - name: ACCEPT_EULA
              value: "Y"
            - name: MSSQL_AGENT_ENABLED
              value: "1"
            - name: MSSQL_SA_PASSWORD
              value: "Testing1122"
          resources:
            requests:
              memory: "1024Mi"
              cpu: "500m"
            limits:
              memory: "2048Mi"
              cpu: "2000m"
          volumeMounts:
            - name: sqlsystem
              mountPath: /var/opt/mssql
            - name: sqldata
              mountPath: /opt/sqlserver/data
            - name: sqllog
              mountPath: /opt/sqlserver/log
  volumeClaimTemplates:
    - metadata:
        name: sqlsystem
      spec:
        accessModes:
         - ReadWriteOncePod
        resources:
          requests:
            storage: 25Gi
        storageClassName: mssql-sc
    - metadata:
        name: sqldata
      spec:
        accessModes:
         - ReadWriteOncePod
        resources:
          requests:
            storage: 25Gi
        storageClassName: mssql-sc
    - metadata:
        name: sqllog
      spec:
        accessModes:
         - ReadWriteOncePod
        resources:
          requests:
            storage: 25Gi
        storageClassName: mssql-sc
</pre></code>

---

# Demo

---

# High Availability

---

## Pod Tolerations
<!-- .slide: style="text-align: left;"> -->
TBD

---

## Example Tolerations
<!-- .slide: style="text-align: left;"> -->
TBD

---

# Demo

---

# Customisation

---

## SQL Server Container Images
<!-- .slide: style="text-align: left;"> -->
TBD

---

## Building custom SQL Server images
<!-- .slide: style="text-align: left;"> -->
TBD

---

# Demo

---

## Resources
<!-- .slide: style="text-align: left;"> -->
<font size="6">
<a href="https://github.com/dbafromthecold/SQLServerAndKubernetes">https://github.com/dbafromthecold/SQLServerAndKubernetes</a><br>
</font>

<p align="center">
  <img src="images/SqlServerAndKubernetesQr.png" />
</p>

