# paperless

![Version: 0.5.3](https://img.shields.io/badge/Version-0.5.3-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 2.20.7](https://img.shields.io/badge/AppVersion-2.20.7-informational?style=flat-square)

A Helm chart for Paperless

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| TZ | string | `"Europe/Amsterdam"` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.repository | string | `"ghcr.io/paperless-ngx/paperless-ngx"` |  |
| image.tag | string | `""` |  |
| ingress.annotations | object | `{}` |  |
| ingress.className | string | `""` |  |
| ingress.enabled | bool | `false` |  |
| ingress.hosts[0].host | string | `"chart-example.local"` |  |
| ingress.hosts[0].paths[0].path | string | `"/"` |  |
| ingress.hosts[0].paths[0].pathType | string | `"ImplementationSpecific"` |  |
| ingress.tls[0].hosts[0] | string | `"chart-example.local"` |  |
| ingress.tls[0].secretName | string | `"chart-example-tls"` |  |
| livenessProbe.httpGet.path | string | `"/"` |  |
| livenessProbe.httpGet.port | string | `"http"` |  |
| livenessProbe.initialDelaySeconds | int | `60` |  |
| networkPolicy.egress.enabled | bool | `false` |  |
| networkPolicy.egress.rules | list | `[]` |  |
| networkPolicy.enabled | bool | `false` |  |
| networkPolicy.ingress.enabled | bool | `false` |  |
| networkPolicy.ingress.rules | list | `[]` |  |
| paperless.database.existingSecret | object | `{"dbHostKey":null,"dbNameKey":null,"dbPasswordKey":null,"dbPortKey":null,"dbUserKey":null,"name":"paperless-ngx-db-secret"}` | Optional for everything but the password. Override the direct value options above |
| paperless.database.existingSecret.dbHostKey | string | `nil` | Optional, if not set `paperless.database.host` value will be used |
| paperless.database.existingSecret.dbNameKey | string | `nil` | Optional, if not set `paperless.database.name` value will be used |
| paperless.database.existingSecret.dbPasswordKey | string | `nil` | Required |
| paperless.database.existingSecret.dbPortKey | string | `nil` | Optional, if not set `paperless.database.port` value will be used |
| paperless.database.existingSecret.dbUserKey | string | `nil` | Optional, if not set `paperless.database.user` value will be used |
| paperless.database.host | string | `"paperless-postgresql"` |  |
| paperless.database.name | string | `"paperless"` |  |
| paperless.database.port | int | `5432` |  |
| paperless.database.user | string | `"paperless"` |  |
| paperless.existingSecret.adminPasswordKey | string | `"admin-password"` |  |
| paperless.existingSecret.adminUsernameKey | string | `"admin-username"` |  |
| paperless.existingSecret.name | string | `"paperless-ngx-secret"` |  |
| paperless.existingSecret.secretKeyKey | string | `"secret-key"` |  |
| paperless.ocrLanguage | string | `"deu"` |  |
| paperless.port | int | `8000` |  |
| paperless.redis.existingSecret | object | `{"name":"paperless-ngx-redis-secret","redisPasswordKey":null}` | Optional but recommended |
| paperless.redis.existingSecret.redisPasswordKey | string | `nil` | Optional but recommended |
| paperless.redis.host | string | `"paperless-valkey"` |  |
| paperless.redis.port | int | `6379` |  |
| paperless.url | string | `"https://paperless.example.org"` |  |
| podDisruptionBudget.enabled | bool | `true` |  |
| podDisruptionBudget.minAvailable | int | `1` |  |
| podDisruptionBudget.unhealthyPodEvictionPolicy | string | `"AlwaysAllow"` |  |
| podSecurityContext | object | `{}` |  |
| readinessProbe.httpGet.path | string | `"/"` |  |
| readinessProbe.httpGet.port | string | `"http"` |  |
| readinessProbe.initialDelaySeconds | int | `60` |  |
| replicaCount | int | `1` |  |
| resources.limits.cpu | string | `"500m"` |  |
| resources.limits.memory | string | `"2Gi"` |  |
| resources.requests.cpu | string | `"250m"` |  |
| resources.requests.memory | string | `"512Mi"` |  |
| securityContext | object | `{}` |  |
| service.port | int | `8000` |  |
| service.type | string | `"ClusterIP"` |  |
| serviceAccount.annotations | object | `{}` |  |
| serviceAccount.automount | bool | `true` |  |
| serviceAccount.create | bool | `true` |  |
| serviceAccount.name | string | `""` |  |
| strategy.rollingUpdate.maxSurge | int | `1` |  |
| strategy.rollingUpdate.maxUnavailable | int | `1` |  |
| strategy.type | string | `"RollingUpdate"` |  |
| volumes[0].accessMode | string | `"ReadWriteMany"` |  |
| volumes[0].claimName | string | `"paperless-ngx-data"` |  |
| volumes[0].mountPath | string | `"/usr/src/paperless/data"` |  |
| volumes[0].name | string | `"data"` |  |
| volumes[0].size | string | `"5Gi"` |  |
| volumes[1].accessMode | string | `"ReadWriteMany"` |  |
| volumes[1].claimName | string | `"paperless-ngx-media"` |  |
| volumes[1].mountPath | string | `"/usr/src/paperless/media"` |  |
| volumes[1].name | string | `"media"` |  |
| volumes[1].size | string | `"5Gi"` |  |
| volumes[2].accessMode | string | `"ReadWriteMany"` |  |
| volumes[2].claimName | string | `"paperless-ngx-export"` |  |
| volumes[2].mountPath | string | `"/usr/src/paperless/export"` |  |
| volumes[2].name | string | `"export"` |  |
| volumes[2].size | string | `"5Gi"` |  |
| volumes[3].emptyDir | object | `{}` |  |
| volumes[3].mountPath | string | `"/usr/src/paperless/consume"` |  |
| volumes[3].name | string | `"consume"` |  |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.14.2](https://github.com/norwoodj/helm-docs/releases/v1.14.2)
