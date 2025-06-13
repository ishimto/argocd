#!/bin/bash

install-all(){
    bash argo-setup/install-cd.sh
    bash argo-setup/install-rollouts.sh
    bash vault-setup/install.sh
    bash eso-setup/install.sh
}


PS3='Please enter your choice: '
options=("ArgoCD" "Argo Rollouts" "CD+Rollouts" "Vault" "ESO" "ALL" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "ArgoCD")
            bash argo-setup/install-cd.sh
            break
            ;;
        "Argo Rollouts")
            bash argo-setup/install-rollouts.sh
            break
            ;;
        "CD+Rollouts")
            bash argo-setup/install-cd.sh
            bash argo-setup/install-rollouts.sh
            break
            ;;
        "Vault")
            bash vault-setup/install.sh
            break
            ;;
        "ESO")
            bash eso-setup/install.sh
            break
            ;;
        "ALL")
            install-all
            break
            ;;
        "Quit")
            break
            ;;
        *) echo "invalid option $REPLY";;
    esac
done
