{{/*
Expand the name of the chart.
*/}}
{{- define "cluster-agent.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "cluster-agent.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "cluster-agent.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "cluster-agent.labels" -}}
helm.sh/chart: {{ include "cluster-agent.chart" . }}
{{ include "cluster-agent.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "cluster-agent.selectorLabels" -}}
app.kubernetes.io/name: {{ include "cluster-agent.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "cluster-agent.serviceAccountName" -}}
{{- if .Values.clusterAgent.serviceAccount.create }}
{{- default (include "cluster-agent.fullname" .) .Values.clusterAgent.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.clusterAgent.serviceAccount.name }}
{{- end }}
{{- end }}

{{- define "check-cluster-name" }}
{{- $length := len .Values.clusterName -}}
{{- if (gt $length 80)}}
{{- fail "Your `clusterName` isn’t valid it has to be below 81 chars." -}}
{{- end}}
{{- end -}}

{{/*
Return the cluster name
*/}}
{{- define "cluster-agent.clusterName" -}}
{{- .Values.clusterName | default "" -}}
{{- end -}}

{{/*
Return the epsagon token
*/}}
{{- define "cluster-agent.epsagonToken" -}}
{{- .Values.epsagonToken | default "" -}}
{{- end -}}

{{/*
Validate all template required values are set
*/}}
{{- define "cluster-agent.isValid" -}}
{{- $clusterName := include "cluster-agent.clusterName" . -}}
{{- $epsagonToken := include "cluster-agent.epsagonToken" . -}}
{{- and $epsagonToken $clusterName}}
{{- end -}}