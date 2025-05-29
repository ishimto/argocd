# ArgoCD & Argo Rollouts Setup

## Table of Contents
- [Prerequisites](#prerequisites)
- [Installation](#installation)
- [Accessing ArgoCD](#accessing-argocd)
- [Uninstall](#uninstall)
- [References](#references)

## Prerequisites

- Kubernetes cluster (e.g., Minikube, EKS, etc.)
- [ArgoCD CLI](https://argo-cd.readthedocs.io/en/stable/cli_installation/)
- [Argo Rollouts CLI](https://argo-rollouts.readthedocs.io/en/stable/installation/)

## Installation

To set up your cluster with ArgoCD and Argo Rollouts, run:
```sh
bash ./install.sh
```
This script will:
- Install **ArgoCD** (GitOps tool)
- Install **Argo Rollouts** (advanced deployment strategies)
- Log in to your ArgoCD server for CLI usage
- Open a port-forward to the ArgoCD UI at [localhost:1234](http://localhost:1234)

## Accessing ArgoCD

- Web UI: [http://localhost:1234](http://localhost:1234)
- Default username: `admin`
- To get the initial password:
  ```sh
  kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d
  ```

## Uninstall

To remove ArgoCD and Argo Rollouts from your cluster:
```sh
bash ./delete.sh
```

## References

- [ArgoCD Documentation](https://argo-cd.readthedocs.io/)
- [Argo Rollouts Documentation](https://argoproj.github.io/argo-rollouts/)