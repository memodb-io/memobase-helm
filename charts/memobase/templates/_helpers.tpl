{{/*
Expand the name of the chart.
*/}}
{{- define "memobase.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "memobase.fullname" -}}
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
{{- define "memobase.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "memobase.labels" -}}
helm.sh/chart: {{ include "memobase.chart" . }}
{{ include "memobase.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "memobase.selectorLabels" -}}
app.kubernetes.io/name: {{ include "memobase.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "memobase.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "memobase.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}

{{- define "memobase.validatePostgresConfig" -}}
{{- if and .Values.postgresql.enabled .Values.externalStorage.postgresql.enabled -}}
{{- fail "Error: Only one PostgreSQL configuration can be enabled. Set either postgresql.enabled=true or externalStorage.postgresql.enabled=true, not both." -}}
{{- end -}}
{{- if not (or .Values.postgresql.enabled .Values.externalStorage.postgresql.enabled) -}}
{{- fail "Error: No PostgreSQL configuration is enabled. Set either postgresql.enabled=true or externalStorage.postgresql.enabled=true." -}}
{{- end -}}
{{- end -}}

{{- define "memobase.validateRedisConfig" -}}
{{- if and .Values.redis.enabled .Values.externalStorage.redis.enabled -}}
{{- fail "Error: Only one Redis configuration can be enabled. Set either redis.enabled=true or externalStorage.redis.enabled=true, not both." -}}
{{- end -}}
{{- if not (or .Values.redis.enabled .Values.externalStorage.redis.enabled) -}}
{{- fail "Error: No Redis configuration is enabled. Set either redis.enabled=true or externalStorage.redis.enabled=true." -}}
{{- end -}}
{{- end -}}