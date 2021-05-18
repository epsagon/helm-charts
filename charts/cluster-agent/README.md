<p align="center">
  <a href="https://epsagon.com" target="_blank" align="center">
    <img src="https://cdn2.hubspot.net/hubfs/4636301/Positive%20RGB_Logo%20Horizontal%20-01.svg" width="300">
  </a>
  <br />
</p>

# Epsagon Agent

![Version: 0.1.10](https://img.shields.io/badge/Version-0.1.10-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 1.0.5](https://img.shields.io/badge/AppVersion-1.0.5-informational?style=flat-square)

## How to use Epsagon Helm repository
You need to add this repository to your Helm repositories:

```bash
helm repo add epsagon https://helm.epsagon.com
helm repo update
```

## Prerequisites

Kubernetes 1.16+

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| https://prometheus-community.github.io/helm-charts/ | metrics-agent(prometheus) | 13.8.0 |
| https://prometheus-community.github.io/helm-charts/ | mongodb-metrics(prometheus-mongodb-exporter) | 2.8.1 |
| https://prometheus-community.github.io/helm-charts/ | rabbitmq-metrics(prometheus-rabbitmq-exporter) | 1.0.0 |
| https://prometheus-community.github.io/helm-charts/ | redis-metrics(prometheus-redis-exporter) | 4.0.2 |

### Installing the Cluster Agent Chart
To install the chart with the release name <RELEASE_NAME>:
1. Retrieve your Epsagon Token from your Agent Installation Instructions
2. Choose a name for your cluster.
<br>
Make sure the configured cluster name matches the cluster name used when configuring the prometheus remote write.
<br>
The chosen cluster name will be available in Epsagon dashboard.
<br>
Then, run:

```bash
helm install <RELEASE_NAME> \
  --set epsagonToken=<EPSAGON_TOKEN> --set clusterName=<CLUSTER_NAME> epsagon/cluster-agent
```
### Uninstalling the Chart

To uninstall/delete the `<RELEASE_NAME>` deployment:

```bash
helm delete <RELEASE_NAME>
```

The command removes all the Kubernetes components associated with the chart and deletes the release.

## All configuration options

The following table lists the configurable parameters of the chart. Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`.

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| clusterAgent.affinity | object | `{}` |  |
| clusterAgent.epsagonUrl | string | `"https://collector.epsagon.com/resources/v1"` | The url to send the data to |
| clusterAgent.fullnameOverride | string | `""` |  |
| clusterAgent.image.pullPolicy | string | `"IfNotPresent"` |  |
| clusterAgent.image.repository | string | `"epsagon/cluster-agent"` |  |
| clusterAgent.image.tag | string | `""` |  |
| clusterAgent.imagePullSecrets | list | `[]` |  |
| clusterAgent.nameOverride | string | `""` |  |
| clusterAgent.nodeSelector | object | `{}` |  |
| clusterAgent.podAnnotations | object | `{}` |  |
| clusterAgent.podSecurityContext | object | `{}` |  |
| clusterAgent.rbac.create | bool | `true` | If true, create & use RBAC resources |
| clusterAgent.resources | object | `{}` |  |
| clusterAgent.securityContext | object | `{}` |  |
| clusterAgent.serviceAccount.annotations | object | `{}` | Annotations to add to the service account |
| clusterAgent.serviceAccount.create | bool | `true` | Specifies whether a service account should be created |
| clusterAgent.serviceAccount.name | string | `""` | The name of the service account to use. If not set and create is true, a name is generated using the fullname template |
| clusterAgent.tolerations | list | `[]` |  |
| clusterName | string | `""` | Set a unique cluster name to allow multiple clusters to integrate with Epsagon, while easily identifying where the resources are coming from |
| debug | string | `"false"` |  |
| epsagonToken | string | `""` | Set the Epsagon token of your account |
| metrics-agent.alertmanager.enabled | bool | `false` |  |
| metrics-agent.nodeExporter.enabled | bool | `false` |  |
| metrics-agent.pushgateway.enabled | bool | `false` |  |
| metrics-agent.server.remoteWrite | list | `[]` |  |
| metrics-agent.serviceAccounts.alertmanager.create | bool | `false` |  |
| metrics-agent.serviceAccounts.nodeExporter.create | bool | `false` |  |
| metrics-agent.serviceAccounts.pushgateway.create | bool | `false` |  |
| metrics.enabled | bool | `false` |  |
| metrics.mongodb.enabled | bool | `false` |  |
| metrics.rabbitmq.enabled | bool | `false` |  |
| metrics.redis.enabled | bool | `false` |  |
| mongodb-metrics.podAnnotations."prometheus.io/path" | string | `"/metrics"` |  |
| mongodb-metrics.podAnnotations."prometheus.io/port" | string | `"9216"` |  |
| mongodb-metrics.podAnnotations."prometheus.io/scrape" | string | `"true"` |  |
| rabbitmq-metrics.annotations."prometheus.io/path" | string | `"/metrics"` |  |
| rabbitmq-metrics.annotations."prometheus.io/port" | string | `"9419"` |  |
| rabbitmq-metrics.annotations."prometheus.io/scrape" | string | `"true"` |  |
| redis-metrics.annotations."prometheus.io/path" | string | `"/metrics"` |  |
| redis-metrics.annotations."prometheus.io/port" | string | `"9121"` |  |
| redis-metrics.annotations."prometheus.io/scrape" | string | `"true"` |  |
