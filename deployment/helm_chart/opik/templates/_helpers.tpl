{{/*
Expand the name of the chart.
*/}}
{{- define "opik.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "opik.fullname" -}}
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
{{- define "opik.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "opik.labels" -}}
{{ include "opik.selectorLabels" . }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "opik.selectorLabels" -}}
app.kubernetes.io/name: {{ include "opik.name" $ }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "opik.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "opik.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}

{{/*
Spot instance configuration for cost optimization
*/}}
{{- define "opik.spotInstanceConfig" -}}
{{- if .Values.spotInstance.enabled }}
{{- if .Values.spotInstance.requireSpot }}
tolerations:
- key: "{{ .Values.spotInstance.taintKey }}"
  operator: "Equal"
  value: "true"
  effect: "NoSchedule"
nodeSelector:
  cloud.google.com/gke-spot: "true"
{{- else if .Values.spotInstance.preferSpot }}
affinity:
  nodeAffinity:
    preferredDuringSchedulingIgnoredDuringExecution:
    - weight: 1
      preference:
        matchExpressions:
        - key: cloud.google.com/gke-spot
          operator: In
          values:
          - "true"
{{- end }}
{{- end }}
{{- end -}}
