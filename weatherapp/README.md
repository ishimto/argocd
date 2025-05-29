# WeatherApp

## Prerequisite

[This Project](https://github.com/ishimto/weatherapp/tree/main/app_docker_nginx/app)
[edit values.yaml](https://github.com/ishimto/argocd/tree/main/weatherapp/helm)

create secrets.yaml with this yaml template:

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
make sure the secrets.yaml is in your .gitignore to avoid mistakes.





