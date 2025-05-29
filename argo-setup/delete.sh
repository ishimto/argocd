#!/bin/bash


kubectl delete -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml #argocd
kubectl delete -n argo-rollouts -f https://github.com/argoproj/argo-rollouts/releases/latest/download/install.yaml # argo rollouts
kubectl delete namespace argocd
kubectl delete namespace argo-rollouts

