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
| https://prometheus-community.github.io/helm-charts/ | epsagon-prometheus(prometheus) | 13.8.0 |
| https://prometheus-community.github.io/helm-charts/ | epsagon-mongodb-exporter(prometheus-mongodb-exporter) | 2.8.1 |
| https://prometheus-community.github.io/helm-charts/ | epsagon-rabbitmq-exporter(prometheus-rabbitmq-exporter) | 1.0.0 |
| https://prometheus-community.github.io/helm-charts/ | epsagon-redis-exporter(prometheus-redis-exporter) | 4.0.2 |

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
helm delete <RELEASE_NAME> --purge
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
| epsagon-mongodb-exporter.podAnnotations."prometheus.io/path" | string | `"/metrics"` |  |
| epsagon-mongodb-exporter.podAnnotations."prometheus.io/port" | string | `"9216"` |  |
| epsagon-mongodb-exporter.podAnnotations."prometheus.io/scrape" | string | `"true"` |  |
| epsagon-prometheus.alertmanager.enabled | bool | `false` |  |
| epsagon-prometheus.nodeExporter.enabled | bool | `false` |  |
| epsagon-prometheus.pushgateway.enabled | bool | `false` |  |
| epsagon-prometheus.server.persistentVolume.size | string | `"1Gi"` |  |
| epsagon-prometheus.server.remoteWrite | list | `[]` |  |
| epsagon-prometheus.serviceAccounts.alertmanager.create | bool | `false` |  |
| epsagon-prometheus.serviceAccounts.nodeExporter.create | bool | `false` |  |
| epsagon-prometheus.serviceAccounts.pushgateway.create | bool | `false` |  |
| epsagon-rabbitmq-exporter.annotations."prometheus.io/path" | string | `"/metrics"` |  |
| epsagon-rabbitmq-exporter.annotations."prometheus.io/port" | string | `"9419"` |  |
| epsagon-rabbitmq-exporter.annotations."prometheus.io/scrape" | string | `"true"` |  |
| epsagon-redis-exporter.annotations."prometheus.io/path" | string | `"/metrics"` |  |
| epsagon-redis-exporter.annotations."prometheus.io/port" | string | `"9121"` |  |
| epsagon-redis-exporter.annotations."prometheus.io/scrape" | string | `"true"` |  |
| epsagonToken | string | `""` | Set the Epsagon token of your account |
| monitoring.enabled | bool | `false` |  |
| monitoring.mongodb.enabled | bool | `false` | enable mongodb monitoring |
| monitoring.rabbitmq.enabled | bool | `false` | enable rabbitmq monitoring |
| monitoring.redis.enabled | bool | `false` | enable redis monitoring |
