# Epsagon Agent

## How to use Epsagon Helm repository
You need to add this repository to your Helm repositories:

```bash
helm repo add epsagon https://helm.epsagon.com
helm repo update
```

## Prerequisites
Kubernetes 1.4+ or OpenShift 3.4+

## Quick start

### Installing the Cluster Agent Chart
To install the chart with the release name <RELEASE_NAME>, retrieve your Epsagon Token from your Agent Installation Instructions and run:

```bash
helm install <RELEASE_NAME> \
  --set epsagonToken=<EPSAGON_TOKEN> epsagon/cluster-agent
```