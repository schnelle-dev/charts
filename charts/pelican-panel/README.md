# pelican-panel

A Helm chart for Kubernetes

![Version: 0.2.2](https://img.shields.io/badge/Version-0.2.2-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: v1.0.0-beta30](https://img.shields.io/badge/AppVersion-v1.0.0--beta30-informational?style=flat-square)

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
| fullnameOverride | string | `""` |  |
| httpRoute.annotations | object | `{}` |  |
| httpRoute.enabled | bool | `false` |  |
| httpRoute.hostnames[0] | string | `"chart-example.local"` |  |
| httpRoute.parentRefs[0].name | string | `"gateway"` |  |
| httpRoute.parentRefs[0].sectionName | string | `"http"` |  |
| httpRoute.rules[0].matches[0].path.type | string | `"PathPrefix"` |  |
| httpRoute.rules[0].matches[0].path.value | string | `"/headers"` |  |
| image | object | `{"pullPolicy":"IfNotPresent","repository":"ghcr.io/pelican-dev/panel","tag":""}` | main application image settings |
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
| nodeSelector | object | `{}` |  |
| pelican.appUrl | string | `"https://example.com"` | the url where the panel will be accessible |
| pelican.dataPVC | object | `{"accessModes":["ReadWriteOnce"],"enabled":true,"size":"4Gi","storageClassName":""}` | pvc settings for pelican data (plugins, fonts, if used: sqlite) |
| pelican.dataPVC.accessModes | list | `["ReadWriteOnce"]` | access modes for pvc |
| pelican.dataPVC.enabled | bool | `true` | enable or disable automatic pvc creation and mounting |
| pelican.dataPVC.size | string | `"4Gi"` | size of pvc |
| pelican.dataPVC.storageClassName | string | `""` | storage class for automatic pvc creation |
| pelican.externalDatabase | object | `{"auth":{"externalSecretName":"","passwordKey":"","usernameKey":""},"database":"","enabled":false,"host":"","port":5432}` | external database settings |
| pelican.externalDatabase.auth | object | `{"externalSecretName":"","passwordKey":"","usernameKey":""}` | auth settings for external database |
| pelican.externalDatabase.auth.externalSecretName | string | `""` | name of an external secret containing username and password |
| pelican.externalDatabase.auth.passwordKey | string | `""` | key in the external secret for the password |
| pelican.externalDatabase.auth.usernameKey | string | `""` | key in the external secret for the username |
| pelican.externalDatabase.database | string | `""` | name of the database |
| pelican.externalDatabase.enabled | bool | `false` | enable or disable external database usage |
| pelican.externalDatabase.host | string | `""` | host of the external database |
| pelican.externalDatabase.port | int | `5432` | port of the external database |
| pelican.logsPVC | object | `{"accessModes":["ReadWriteOnce"],"enabled":true,"size":"1Gi","storageClassName":""}` | pvc settings for pelican logs |
| pelican.logsPVC.accessModes | list | `["ReadWriteOnce"]` | access modes for pvc |
| pelican.logsPVC.enabled | bool | `true` | enable or disable automatic pvc creation and mounting |
| pelican.logsPVC.size | string | `"1Gi"` | size of pvc |
| pelican.logsPVC.storageClassName | string | `""` | storage class for automatic pvc creation |
| pelican.redis | object | `{"auth":{"enabled":false,"externalSecretName":"","passwordKey":""},"enabled":false,"host":"","port":6379}` | external redis settings |
| pelican.redis.auth | object | `{"enabled":false,"externalSecretName":"","passwordKey":""}` | auth settings for external redis |
| pelican.redis.auth.enabled | bool | `false` | enable or disable redis password usage |
| pelican.redis.auth.externalSecretName | string | `""` | name of an external secret containing the password |
| pelican.redis.auth.passwordKey | string | `""` | key in the external secret for the password |
| pelican.redis.enabled | bool | `false` | enable or disable external redis usage |
| pelican.redis.host | string | `""` | host of the external redis |
| pelican.redis.port | int | `6379` | port of the external redis |
| pluginDownloader | object | `{"directDownloads":[],"image":{"pullPolicy":"IfNotPresent","repository":"curlimages/curl","tag":"latest"},"repoDownloads":[{"plugins":["minecraft-modrinth","mclogs-uploader","robo-avatars","snowflakes"],"replaceExisting":false,"url":"https://github.com/pelican-dev/plugins/archive/refs/heads/main.zip"}]}` | download plugins using an init container |
| pluginDownloader.directDownloads | list | `[]` | download plugin zips directly |
| pluginDownloader.image | object | `{"pullPolicy":"IfNotPresent","repository":"curlimages/curl","tag":"latest"}` | image used to download and unzip plugins |
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
| securityContext.runAsGroup | int | `82` |  |
| securityContext.runAsNonRoot | bool | `true` |  |
| securityContext.runAsUser | int | `82` |  |
| service.port | int | `80` |  |
| service.type | string | `"ClusterIP"` |  |
| serviceAccount.annotations | object | `{}` |  |
| serviceAccount.automount | bool | `true` |  |
| serviceAccount.create | bool | `true` |  |
| serviceAccount.name | string | `""` |  |
| tolerations | list | `[]` |  |
| volumeMounts | list | `[]` |  |
| volumes | list | `[]` |  |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.14.2](https://github.com/norwoodj/helm-docs/releases/v1.14.2)
