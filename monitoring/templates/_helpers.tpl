{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "fullname" -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "labels.selector" -}}
app: {{ template "name" . }}
{{ template "labels.groupAndProvider" . }}
{{- end -}}

{{- define "labels.stakater" -}}
{{ template "labels.selector" . }}
version: "{{ .Values.prometheusOperator.labels.version }}"
{{- end -}}

# Prometheus
{{- define "labels.selector-prom" -}}
app: {{ template "name" . }}-prometheus
{{ template "labels.groupAndProvider" . }}
{{- end -}}

{{- define "labels.stakater-prom" -}}
{{ template "labels.selector-prom" . }}
version: "{{ .Values.prometheus.labels.version }}"
{{- end -}}

# Prometheus Operator
{{- define "labels.selector-po" -}}
app: {{ template "name" . }}-prometheus-operator
{{ template "labels.groupAndProvider" . }}
{{- end -}}

{{- define "labels.stakater-po" -}}
{{ template "labels.selector-po" . }}
version: "{{ .Values.prometheusOperator.labels.version }}"
{{- end -}}

# ServiceMonitor
{{- define "labels.selector-sm" -}}
app: {{ template "name" . }}-servicemonitor
{{ template "labels.groupAndProvider" . }}
{{- end -}}

# Alert manager
{{- define "labels.selector-am" -}}
app: {{ template "name" . }}-alertmanager
{{ template "labels.groupAndProvider" . }}
{{- end -}}

{{- define "labels.stakater-am" -}}
{{ template "labels.selector-am" . }}
version: "{{ .Values.alertmanager.labels.version }}"
{{- end -}}

# Common
{{- define "labels.groupAndProvider" -}}
group: {{ .Values.global.labels.group }}
provider: {{ .Values.global.labels.provider }}
{{- end -}}

{{- define "labels.chart" -}}
chart: "{{ .Chart.Name }}-{{ .Chart.Version }}"
release: {{ .Release.Name | quote }}
heritage: {{ .Release.Service | quote }}
{{- end -}}

