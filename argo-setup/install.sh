#!/bin/bash


# Install
kubectl create namespace argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml #argocd
kubectl create namespace argo-rollouts
kubectl apply -n argo-rollouts -f https://github.com/argoproj/argo-rollouts/releases/latest/download/install.yaml # argo rollouts


init_passowrd=""



# Output

while true
do
    sleep 3
    init_password=$(kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d)
    if [[ -z ${init_password} ]]; then
        continue
    else
        echo "init password: ${init_password}"
        break
   fi
done


kubectl port-forward -n argocd svc/argocd-server 1234:80 &
bash ./login.sh ${init_password}
