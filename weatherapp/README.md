# WeatherApp

## Prerequisite

* [Install ArgoCD + Argo Rollouts](https://github.com/ishimto/argocd/tree/main/argo-setup)

* [Build This Project](https://github.com/ishimto/weatherapp/tree/main/app_docker_nginx/app)

* [edit values.yaml](https://github.com/ishimto/argocd/tree/main/weatherapp/helm)

* create secrets.yaml with this yaml template:

```
apiVersion: v1
kind: Secret
metadata:
  name: docker-cred
data:
  .dockerconfigjson: |
     < your docker cred here >
type: kubernetes.io/dockerconfigjson

```
make sure the secrets.yaml file is in your .gitignore to avoid mistakes.


## ArgoCD App

### Prerequisite

create PAT to your repo with at least privileaged as needed, just read repository.

config your git repo in ArgoCD using argo-cli:

```
argocd repo add <REPO URL> --username <YOUR GIT USERNAME> --password <PAT>
```

or [Declarative](https://argo-cd.readthedocs.io/en/stable/operator-manual/declarative-setup/)


### Create ArgoCD App

run in current dir:

```
kubectl apply -f argoproj-app.yaml
```



### Deployment Strategy: Canary

This argoproj app using Canary deployment strategy, explain:

configured in weatherapp template:

```
  strategy:
    canary:
      steps:
      - setWeight: 20
      - pause: {}
      - setWeight: 40
      - pause: {duration: 10}
      - setWeight: 60
      - pause: {duration: 10}
      - setWeight: 80
      - pause: {duration: 10}
      - setWeight: 100
```

setWeight means how much Pods create in each time, first it will create 20% of replicas, then stop until you'll promote it.

```
kubectl argo rollouts promote <rollout name> -n <namespace>
```

or go to your:

```
localhost:1234
```

also you can open argo rollouts dashboard for better view:

```
kubectl argo rollouts dashboard
```


after this promote it will promote it self after 10 seconds each promote until 100% weight promote.
