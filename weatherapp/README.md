# WeatherApp Helm Chart

This Helm chart deploys the WeatherApp using ArgoCD and supports advanced deployment strategies with Argo Rollouts.

---

## Prerequisites

- [ArgoCD & Argo Rollouts Installed](https://github.com/ishimto/argocd/tree/main/argo-setup)
- [WeatherApp Docker Image Built](https://github.com/ishimto/weatherapp/tree/main)
- Kubernetes cluster access with `kubectl`, `argocd` CLI installed, `argo rollouts` CLI installed.

---

## Setup Instructions

### 1. Configure Secrets and ConfigMaps

Create the following Kubernetes resources before deploying:

**Docker Registry Secret**
```yaml
apiVersion: v1
kind: Secret
metadata:
  name: docker-cred
type: kubernetes.io/dockerconfigjson
data:
  .dockerconfigjson: <your base64-encoded docker config>
```

**Weather API Key ConfigMap**
```yaml
apiVersion: v1
kind: ConfigMap
metadata:
  name: weatherapikey-cm
data:
  API_KEY: <YOUR_WEATHER_API_KEY>
```

> **Note:**  
> Add these files to your `.gitignore` to avoid committing sensitive data.

---

### 2. Configure `values.yaml`

Edit the [values.yaml](./helm/values.yaml) file to set image tags, replica counts, and other configuration options as needed.

---

### 3. Add Your Git Repository to ArgoCD

Create a Personal Access Token (PAT) with at least read access to your repository.

Add your repo to ArgoCD:
```sh
argocd repo add <REPO_URL> --username <YOUR_GIT_USERNAME> --password <PAT>
```
Or use [declarative setup](https://argo-cd.readthedocs.io/en/stable/operator-manual/declarative-setup/).

---

### 4. Deploy the ArgoCD Application

Apply the ArgoCD application manifest:
```sh
kubectl apply -f argoproj-app.yaml
```

---

## Deployment Strategy: Canary (with Argo Rollouts)

This chart uses a canary deployment strategy, managed by Argo Rollouts. Example configuration in the Helm template:

```yaml
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

- **setWeight**: Percentage of traffic shifted to the new version.
- **pause**: Waits for manual promotion or specified duration.

Promote the rollout manually:
```sh
kubectl argo rollouts promote <rollout-name> -n <namespace>
```

Or use the Argo Rollouts dashboard for visualization:
```sh
kubectl argo rollouts dashboard
```
Access it at [localhost:1234](http://localhost:1234).

---

## Additional Notes

- Ensure all sensitive files (secrets, API keys) are excluded from version control.
- For troubleshooting, check ArgoCD and Argo Rollouts documentation.

---

## References

- [ArgoCD Documentation](https://argo-cd.readthedocs.io/)
- [Argo Rollouts Documentation](https://argoproj.github.io/argo-rollouts/)