# Setup ArgoCD

## Prerequisite

Cluster (minikube, eks, whatever)

[install argocd cli](https://argo-cd.readthedocs.io/en/stable/cli_installation/) 
[install argo rollout cli](https://argo-rollouts.readthedocs.io/en/stable/installation/)

## Install 
In order to set-up your cluster with Argo use the following script:

```
bash ./install.sh
```

it will install:

ArgoCD - GitOps tool

Argo Rollouts

* In order to use more [extended features](https://argoproj.github.io/argo-rollouts/) in k8s such as more deployment strategies

it will login to your argocd server in order to use argo cli, and open port-forward to localhost:1234



# Delete

```
bash ./delete.sh
```
