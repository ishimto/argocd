# ArgoCD GitOps Repository

This repository demonstrates GitOps workflows using [ArgoCD](https://argo-cd.readthedocs.io/) and [Argo Rollouts](https://argoproj.github.io/argo-rollouts/) for advanced Kubernetes deployment strategies.

## Structure

- `argo-setup/` – Scripts and manifests to install ArgoCD and Argo Rollouts
- `weatherapp/` – Example Helm chart and ArgoCD application for a sample WeatherApp

## Quick Start

To install ArgoCD and Argo Rollouts, run the [install script](./argo-setup/install.sh):

```sh
bash ./argo-setup/install.sh
```

See the [argo-setup README](./argo-setup/README.md) for details.

## More Information

Each directory contains its own README with specific instructions and explanations.

---

Feel free to contribute or open issues for questions and improvements!