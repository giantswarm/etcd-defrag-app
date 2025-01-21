{{/*
Expand the name of the chart.
*/}}
{{- define "etcd-defrag.name" -}}
{{- .Chart.Name | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
*/}}
{{- define "etcd-defrag.fullname" -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "etcd-defrag.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "etcd-defrag.labels" -}}
helm.sh/chart: {{ include "etcd-defrag.chart" . }}
{{ include "etcd-defrag.selectorLabels" . }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
application.giantswarm.io/team: {{ index .Chart.Annotations "application.giantswarm.io/team" | quote }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "etcd-defrag.selectorLabels" -}}
app.kubernetes.io/name: {{ include "etcd-defrag.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
