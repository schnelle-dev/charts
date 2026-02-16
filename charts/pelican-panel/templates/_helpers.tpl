{{/*
Expand the name of the chart.
*/}}
{{- define "pelican-panel.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "pelican-panel.fullname" -}}
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
{{- define "pelican-panel.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "pelican-panel.labels" -}}
helm.sh/chart: {{ include "pelican-panel.chart" . }}
{{ include "pelican-panel.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "pelican-panel.selectorLabels" -}}
app.kubernetes.io/name: {{ include "pelican-panel.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "pelican-panel.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "pelican-panel.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}


{{/*
Plugin downloader container
*/}}
{{- define "pelican-panel.plugin-download-container" -}}
- name: plugin-downloader
  image: "{{ .Values.pluginDownloader.image.repository }}:{{ .Values.pluginDownloader.image.tag }}"
  imagePullPolicy: {{ .Values.pluginDownloader.image.pullPolicy }}
  {{- with .Values.securityContext }}
  securityContext:
  {{- toYaml . | nindent 4 }}
  {{- end }}
  resources:
    limits:
        memory: "128Mi"
        cpu: "100m"
    requests:
        memory: "64Mi"
        cpu: "50m"
  volumeMounts:
  - name: pelican-data
    mountPath: /pelican-data
  - name: plugin-downloader-script
    mountPath: /scripts
  - name: temp
    mountPath: /tmp
  command:
  - sh
  - /scripts/plugin-downloader-script.sh
{{- end -}}