# pelican-panel

A Helm chart for Kubernetes

![Version: 0.4.1](https://img.shields.io/badge/Version-0.4.1-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: v1.0.0-beta30](https://img.shields.io/badge/AppVersion-v1.0.0--beta30-informational?style=flat-square)

## Additional Information

This is a helm chart for [pelican panel](https://github.com/pelican-dev/panel). 
It's still a work in progress.

### Features:
  - automatic plugin installation through links to zip files

## Installing the Chart

```console
$ helm repo add foo-bar https://schnelle-dev.github.io/charts
$ helm install my-pelican-panel-installation foo-bar/pelican-panel
```

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` |  |
| env | list | `[]` | Additional env values |
| fullnameOverride | string | `""` |  |
| httpRoute.annotations | object | `{}` |  |
| httpRoute.enabled | bool | `false` |  |
| httpRoute.hostnames[0] | string | `"chart-example.local"` |  |
| httpRoute.parentRefs[0].name | string | `"gateway"` |  |
| httpRoute.parentRefs[0].sectionName | string | `"http"` |  |
| httpRoute.rules[0].matches[0].path.type | string | `"PathPrefix"` |  |
| httpRoute.rules[0].matches[0].path.value | string | `"/headers"` |  |
| image | object | `{"pullPolicy":"Always","repository":"ghcr.io/pelican-dev/panel","tag":""}` | main application image settings |
| imagePullSecrets | list | `[]` |  |
| ingress.annotations | object | `{}` |  |
| ingress.className | string | `""` |  |
| ingress.enabled | bool | `false` |  |
| ingress.hosts[0].host | string | `"chart-example.local"` |  |
| ingress.hosts[0].paths[0].path | string | `"/"` |  |
| ingress.hosts[0].paths[0].pathType | string | `"ImplementationSpecific"` |  |
| ingress.tls | list | `[]` |  |
| livenessProbe.failureThreshold | int | `3` |  |
| livenessProbe.httpGet.path | string | `"/up"` |  |
| livenessProbe.httpGet.port | string | `"http"` |  |
| livenessProbe.initialDelaySeconds | int | `10` |  |
| livenessProbe.periodSeconds | int | `10` |  |
| livenessProbe.successThreshold | int | `1` |  |
| livenessProbe.timeoutSeconds | int | `5` |  |
| nameOverride | string | `""` |  |
| networkPolicy | object | `{"defaultPolicy":{"allHttpsEgress":{"enabled":true},"coreDNSEgress":{"enabled":true,"namespaceSelector":{"matchLabels":{"kubernetes.io/metadata.name":"kube-system"}},"podSelector":{"matchLabels":{"k8s-app":"kube-dns"}}},"traefikIngress":{"enabled":true,"namespaceSelector":{"matchLabels":{"kubernetes.io/metadata.name":"kube-system"}}}},"egressRules":[],"enabled":true,"ingressRules":[]}` | network policy settings |
| networkPolicy.defaultPolicy | object | `{"allHttpsEgress":{"enabled":true},"coreDNSEgress":{"enabled":true,"namespaceSelector":{"matchLabels":{"kubernetes.io/metadata.name":"kube-system"}},"podSelector":{"matchLabels":{"k8s-app":"kube-dns"}}},"traefikIngress":{"enabled":true,"namespaceSelector":{"matchLabels":{"kubernetes.io/metadata.name":"kube-system"}}}}` | default policies |
| networkPolicy.defaultPolicy.allHttpsEgress | object | `{"enabled":true}` | allow all https egress; every egress connection to port 443 |
| networkPolicy.defaultPolicy.allHttpsEgress.enabled | bool | `true` | enable network policy rule to allow all https egress |
| networkPolicy.defaultPolicy.coreDNSEgress | object | `{"enabled":true,"namespaceSelector":{"matchLabels":{"kubernetes.io/metadata.name":"kube-system"}},"podSelector":{"matchLabels":{"k8s-app":"kube-dns"}}}` | coreDNS egress |
| networkPolicy.defaultPolicy.coreDNSEgress.enabled | bool | `true` | enable network policy rule to allow egress to coreDNS |
| networkPolicy.defaultPolicy.coreDNSEgress.namespaceSelector | object | `{"matchLabels":{"kubernetes.io/metadata.name":"kube-system"}}` | set the namespace selector to select the namespace of your coreDNS installation |
| networkPolicy.defaultPolicy.coreDNSEgress.podSelector | object | `{"matchLabels":{"k8s-app":"kube-dns"}}` | set the pod selector to select the coreDNS pods |
| networkPolicy.defaultPolicy.traefikIngress | object | `{"enabled":true,"namespaceSelector":{"matchLabels":{"kubernetes.io/metadata.name":"kube-system"}}}` | traefik ingress |
| networkPolicy.defaultPolicy.traefikIngress.enabled | bool | `true` | enable network policy rule to allow ingress from traefik |
| networkPolicy.defaultPolicy.traefikIngress.namespaceSelector | object | `{"matchLabels":{"kubernetes.io/metadata.name":"kube-system"}}` | set the namespace selector to select the namespace of your traefik installation |
| networkPolicy.egressRules | list | `[]` | additional egress rules for the network policy |
| networkPolicy.enabled | bool | `true` | enable or disable network policy creation |
| networkPolicy.ingressRules | list | `[]` | additional ingress rules for the network policy |
| nodeSelector | object | `{}` |  |
| pelican.appKeyExistingSecret | object | `{"enabled":false,"key":"","name":""}` | settings for the pelican app key; IF NOT SET, AUTOMATIC GENERATION OF IT COULD LEAD TO LONG-TERM DATALOSS IF YOU DON'T SAVE IT... just set it here |
| pelican.appKeyExistingSecret.enabled | bool | `false` | enable or disable usage of an existing secret for the app key |
| pelican.appKeyExistingSecret.key | string | `""` | key in the existing secret for the app key |
| pelican.appKeyExistingSecret.name | string | `""` | name of an existing secret containing the app key |
| pelican.appName | string | `nil` | optional name for the panel. Will be shown in the UI in some places. |
| pelican.appUrl | string | `"https://example.com"` | the url where the panel will be accessible |
| pelican.backup | object | `{"s3":{"bucket":"","enabled":false,"endpoint":"","existingSecret":{"accessKeyIdKey":"","bucketKey":"","endpointKey":"","name":"","regionKey":"","secretAccessKeyKey":""},"region":"","useAsBackupDriver":true,"usePathStyleEndpoint":false}}` | backup settings used for game servers |
| pelican.backup.s3 | object | `{"bucket":"","enabled":false,"endpoint":"","existingSecret":{"accessKeyIdKey":"","bucketKey":"","endpointKey":"","name":"","regionKey":"","secretAccessKeyKey":""},"region":"","useAsBackupDriver":true,"usePathStyleEndpoint":false}` | automatic provision of s3 backup settings |
| pelican.backup.s3.bucket | string | `""` | s3 bucket name; overriden if bucketKey is set in existingSecret |
| pelican.backup.s3.enabled | bool | `false` | enable or disable automatic provision of s3 backup settings |
| pelican.backup.s3.endpoint | string | `""` | s3 endpoint url; overriden if endpointKey is set in existingSecret |
| pelican.backup.s3.existingSecret | object | `{"accessKeyIdKey":"","bucketKey":"","endpointKey":"","name":"","regionKey":"","secretAccessKeyKey":""}` | REQUIRED! existing secret to get s3 settings from. |
| pelican.backup.s3.existingSecret.accessKeyIdKey | string | `""` | REQUIRED! key in the existing secret for the s3 access key id |
| pelican.backup.s3.existingSecret.bucketKey | string | `""` | optional key in the existing secret for the s3 bucket. overrides the bucket name above |
| pelican.backup.s3.existingSecret.endpointKey | string | `""` | optional key in the existing secret for the s3 endpoint |
| pelican.backup.s3.existingSecret.name | string | `""` | name of the existing secret |
| pelican.backup.s3.existingSecret.regionKey | string | `""` | optional key in the existing secret for the s3 region |
| pelican.backup.s3.existingSecret.secretAccessKeyKey | string | `""` | REQUIRED! key in the existing secret for the s3 secret access key |
| pelican.backup.s3.region | string | `""` | s3 region; overriden if regionKey is set in existingSecret |
| pelican.backup.s3.useAsBackupDriver | bool | `true` | whether to set backup mode to s3. leave this on true unless you know what you're doing |
| pelican.backup.s3.usePathStyleEndpoint | bool | `false` | use path style endpoint (needed for some s3 compatible providers) |
| pelican.dataPVC | object | `{"accessModes":["ReadWriteOnce"],"enabled":true,"size":"4Gi","storageClassName":null}` | pvc settings for pelican data (plugins, fonts, if used: sqlite) |
| pelican.dataPVC.accessModes | list | `["ReadWriteOnce"]` | access modes for pvc |
| pelican.dataPVC.enabled | bool | `true` | enable or disable automatic pvc creation and mounting |
| pelican.dataPVC.size | string | `"4Gi"` | size of pvc |
| pelican.dataPVC.storageClassName | string | `nil` | storage class for automatic pvc creation |
| pelican.externalDatabase | object | `{"auth":{"externalSecretName":"","passwordKey":"","usernameKey":""},"database":"","enabled":false,"host":"","port":5432}` | external database settings |
| pelican.externalDatabase.auth | object | `{"externalSecretName":"","passwordKey":"","usernameKey":""}` | auth settings for external database |
| pelican.externalDatabase.auth.externalSecretName | string | `""` | name of an external secret containing username and password |
| pelican.externalDatabase.auth.passwordKey | string | `""` | key in the external secret for the password |
| pelican.externalDatabase.auth.usernameKey | string | `""` | key in the external secret for the username |
| pelican.externalDatabase.database | string | `""` | name of the database |
| pelican.externalDatabase.enabled | bool | `false` | enable or disable external database usage |
| pelican.externalDatabase.host | string | `""` | host of the external database |
| pelican.externalDatabase.port | int | `5432` | port of the external database |
| pelican.logsPVC | object | `{"accessModes":["ReadWriteOnce"],"enabled":true,"size":"1Gi","storageClassName":null}` | pvc settings for pelican logs |
| pelican.logsPVC.accessModes | list | `["ReadWriteOnce"]` | access modes for pvc |
| pelican.logsPVC.enabled | bool | `true` | enable or disable automatic pvc creation and mounting |
| pelican.logsPVC.size | string | `"1Gi"` | size of pvc |
| pelican.logsPVC.storageClassName | string | `nil` | storage class for automatic pvc creation |
| pelican.mail | object | `{"driver":"smtp","enabled":false,"scheme":"smtp","smtp":{"existingSecret":{"fromAddressKey":"","fromNameKey":"","hostKey":"","name":"","passwordKey":"","portKey":"","usernameKey":""},"fromAddress":"no-reply@mypaneladdress.TLD","fromName":"Pelican Panel","host":"smtp.example.com","port":587}}` | mailer settings for pelican |
| pelican.mail.driver | string | `"smtp"` | mailer driver; options can be seen in the pelican WebUI |
| pelican.mail.enabled | bool | `false` | enable or disable mailer configuration |
| pelican.mail.scheme | string | `"smtp"` | mailer scheme; overriden if schemeKey is set in existingSecret |
| pelican.mail.smtp | object | `{"existingSecret":{"fromAddressKey":"","fromNameKey":"","hostKey":"","name":"","passwordKey":"","portKey":"","usernameKey":""},"fromAddress":"no-reply@mypaneladdress.TLD","fromName":"Pelican Panel","host":"smtp.example.com","port":587}` | smtp settings; only used if driver is set to smtp |
| pelican.mail.smtp.existingSecret | object | `{"fromAddressKey":"","fromNameKey":"","hostKey":"","name":"","passwordKey":"","portKey":"","usernameKey":""}` | existing secret to get smtp settings from. |
| pelican.mail.smtp.existingSecret.fromAddressKey | string | `""` | optional key in the existing secret for the mail from address |
| pelican.mail.smtp.existingSecret.fromNameKey | string | `""` | optional key in the existing secret for the mail from name |
| pelican.mail.smtp.existingSecret.hostKey | string | `""` | optional key in the existing secret for the smtp host |
| pelican.mail.smtp.existingSecret.name | string | `""` | name of the existing secret |
| pelican.mail.smtp.existingSecret.passwordKey | string | `""` | REQUIRED! key in the existing secret for the smtp password |
| pelican.mail.smtp.existingSecret.portKey | string | `""` | optional key in the existing secret for the smtp port |
| pelican.mail.smtp.existingSecret.usernameKey | string | `""` | REQUIRED! key in the existing secret for the smtp username |
| pelican.mail.smtp.fromAddress | string | `"no-reply@mypaneladdress.TLD"` | mail from address; overriden if fromAddressKey is set in existingSecret |
| pelican.mail.smtp.fromName | string | `"Pelican Panel"` | mail from name; overriden if fromNameKey is set in existingSecret |
| pelican.mail.smtp.host | string | `"smtp.example.com"` | host of the smtp server; overriden if hostKey is set in existingSecret |
| pelican.mail.smtp.port | int | `587` | port of the smtp server; overriden if portKey is set in existingSecret |
| pelican.redis | object | `{"auth":{"enabled":false,"externalSecretName":"","passwordKey":""},"enabled":false,"host":"","port":6379}` | external redis settings |
| pelican.redis.auth | object | `{"enabled":false,"externalSecretName":"","passwordKey":""}` | auth settings for external redis |
| pelican.redis.auth.enabled | bool | `false` | enable or disable redis password usage |
| pelican.redis.auth.externalSecretName | string | `""` | name of an external secret containing the password |
| pelican.redis.auth.passwordKey | string | `""` | key in the external secret for the password |
| pelican.redis.enabled | bool | `false` | enable or disable external redis usage |
| pelican.redis.host | string | `""` | host of the external redis |
| pelican.redis.port | int | `6379` | port of the external redis |
| pelican.trustedProxies | string | `""` | trusted proxies setting. mainly necessary for uploading files |
| pluginDownloader | object | `{"directDownloads":[],"image":{"pullPolicy":"Always","repository":"curlimages/curl","tag":"latest"},"repoDownloads":[{"plugins":["minecraft-modrinth","mclogs-uploader","robo-avatars","snowflakes"],"replaceExisting":false,"url":"https://github.com/pelican-dev/plugins/archive/refs/heads/main.zip"}]}` | download plugins using an init container |
| pluginDownloader.directDownloads | list | `[]` | download plugin zips directly |
| pluginDownloader.image | object | `{"pullPolicy":"Always","repository":"curlimages/curl","tag":"latest"}` | image used to download and unzip plugins |
| pluginDownloader.repoDownloads | list | `[{"plugins":["minecraft-modrinth","mclogs-uploader","robo-avatars","snowflakes"],"replaceExisting":false,"url":"https://github.com/pelican-dev/plugins/archive/refs/heads/main.zip"}]` | download repositories of multiple plugins |
| podAnnotations | object | `{}` |  |
| podLabels | object | `{}` |  |
| podSecurityContext.fsGroup | int | `82` |  |
| podSecurityContext.fsGroupChangePolicy | string | `"Always"` |  |
| readinessProbe.failureThreshold | int | `3` |  |
| readinessProbe.httpGet.path | string | `"/up"` |  |
| readinessProbe.httpGet.port | string | `"http"` |  |
| readinessProbe.initialDelaySeconds | int | `10` |  |
| readinessProbe.periodSeconds | int | `10` |  |
| readinessProbe.successThreshold | int | `1` |  |
| readinessProbe.timeoutSeconds | int | `5` |  |
| resources.limits.cpu | string | `"100m"` |  |
| resources.limits.memory | string | `"1024Mi"` |  |
| resources.requests.cpu | string | `"100m"` |  |
| resources.requests.memory | string | `"256Mi"` |  |
| securityContext.allowPrivilegeEscalation | bool | `false` |  |
| securityContext.capabilities.drop[0] | string | `"ALL"` |  |
| securityContext.readOnlyRootFilesystem | bool | `true` |  |
| securityContext.runAsGroup | int | `82` |  |
| securityContext.runAsNonRoot | bool | `true` |  |
| securityContext.runAsUser | int | `82` |  |
| securityContext.seccompProfile.type | string | `"RuntimeDefault"` |  |
| service.port | int | `80` |  |
| service.type | string | `"ClusterIP"` |  |
| serviceAccount.annotations | object | `{}` |  |
| serviceAccount.automount | bool | `false` |  |
| serviceAccount.create | bool | `true` |  |
| serviceAccount.name | string | `""` |  |
| tolerations | list | `[]` |  |
| volumeMounts | list | `[]` | Additional volumeMounts on the output Deployment definition. |
| volumes | list | `[]` | Additional volumes on the output Deployment definition. |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.14.2](https://github.com/norwoodj/helm-docs/releases/v1.14.2)
