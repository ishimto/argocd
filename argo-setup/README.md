# Setup ArgoCD

## Prerequisite

Cluster (minikube, eks, whatever)

[install argocd cli](https://argo-cd.readthedocs.io/en/stable/cli_installation/) 


## Install 
In order to set-up your cluster with Argo use the following script:

```
bash ./install.sh
```

it will install:

ArgoCD - GitOps tool

Argo Rollouts

* In order to use more strategies in your deployment, uses with kind: Rollout

it will login to your argocd server in order to use argo cli, and open port-forward to localhost:1234



# Delete

```
bash ./delete.sh
```
