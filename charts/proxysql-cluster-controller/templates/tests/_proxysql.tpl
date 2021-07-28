{{/*
ProxySQL SSL directory
*/}}
{{- define "proxysql.sslDir" -}}
{{- if .Values.ssl.fromSecret -}}
/etc/proxysql/ssl
{{- else -}}
/etc/proxysql
{{- end -}}
{{- end -}}

{{/*
ProxySQL SSL config
*/}}
{{- define "proxysql.sslConf" -}}
{{- if .Values.ssl.fromSecret }}
ssl_p2s_ca="{{ include "proxysql.sslDir" . }}/ca.pem"
{{- else if .Values.ssl.ca }}
ssl_p2s_ca="{{ include "proxysql.sslDir" . }}/ca.pem"
{{- end -}}
{{- if or (and .Values.ssl.cert .Values.ssl.key) .Values.ssl.fromSecret }}
ssl_p2s_cert="{{ include "proxysql.sslDir" . }}/cert.pem"
ssl_p2s_key="{{ include "proxysql.sslDir" . }}/key.pem"
{{- end -}}
{{- end -}}
