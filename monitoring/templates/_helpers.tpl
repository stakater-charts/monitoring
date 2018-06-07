{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "monitoring.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "monitoring.fullname" -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "monitoring.labels.selector" -}}
app: {{ template "monitoring.name" . }}
{{ template "labels.groupAndProvider" . }}
{{- end -}}

{{- define "monitoring.labels.stakater" -}}
{{ template "monitoring.labels.selector" . }}
version: "{{ .Values.prometheusOperator.labels.version }}"
{{- end -}}

# Prometheus
{{- define "monitoring.labels.selector-prom" -}}
app: {{ template "monitoring.name" . }}-prometheus
{{ template "labels.groupAndProvider" . }}
{{- end -}}

{{- define "monitoring.labels.stakater-prom" -}}
{{ template "monitoring.labels.selector-prom" . }}
version: "{{ .Values.prometheus.labels.version }}"
{{- end -}}

# Prometheus Operator
{{- define "monitoring.labels.selector-po" -}}
app: {{ template "monitoring.name" . }}-prometheus-operator
{{ template "labels.groupAndProvider" . }}
{{- end -}}

{{- define "monitoring.labels.stakater-po" -}}
{{ template "monitoring.labels.selector-po" . }}
version: "{{ .Values.prometheusOperator.labels.version }}"
{{- end -}}

# ServiceMonitor
{{- define "monitoring.labels.selector-sm" -}}
app: {{ template "monitoring.name" . }}-servicemonitor
{{ template "labels.groupAndProvider" . }}
{{- end -}}

# Alert manager
{{- define "monitoring.labels.selector-am" -}}
app: {{ template "monitoring.name" . }}-alertmanager
{{ template "labels.groupAndProvider" . }}
{{- end -}}

{{- define "monitoring.labels.stakater-am" -}}
{{ template "monitoring.labels.selector-am" . }}
version: "{{ .Values.alertmanager.labels.version }}"
{{- end -}}

# Common
{{- define "labels.groupAndProvider" -}}
group: {{ .Values.global.labels.group }}
provider: {{ .Values.global.labels.provider }}
{{- end -}}

{{- define "monitoring.labels.chart" -}}
chart: "{{ .Chart.Name }}-{{ .Chart.Version }}"
release: {{ .Release.Name | quote }}
heritage: {{ .Release.Service | quote }}
{{- end -}}

