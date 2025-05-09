# etcd-defrag

![Version: 1.0.4](https://img.shields.io/badge/Version-1.0.4-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: v0.27.0](https://img.shields.io/badge/AppVersion-v0.27.0-informational?style=flat-square)

etcd-defrag is an easy to use and smart etcd defragmentation tool.

**Homepage:** <https://github.com/giantswarm/etcd-defrag-app>

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{"nodeAffinity":{"requiredDuringSchedulingIgnoredDuringExecution":{"nodeSelectorTerms":[{"matchExpressions":[{"key":"node-role.kubernetes.io/control-plane","operator":"Exists"}]}]}}}` | Affinity. |
| annotations | object | `{}` | Common annotations. |
| args | list | `[]` | Additional arguments. |
| automountServiceAccountToken | bool | `false` | Wheter to auto-mount service account token or not. This app does not require API access nor a service account, so it should also not require a service account token. |
| caCertPath | string | `"/etc/kubernetes/pki/etcd/ca.crt"` | CA certificate path. |
| clientCertPath | string | `"/etc/kubernetes/pki/apiserver-etcd-client.crt"` | Client certificate path. |
| clientKeyPath | string | `"/etc/kubernetes/pki/apiserver-etcd-client.key"` | Client key path. |
| defragRule | string | `"dbQuotaUsage > 0.8 && dbSizeFree > dbQuota * 0.1"` | etcd defrag rule.  Available variables:  dbSize:       Total size of the etcd database. dbSizeInUse:  Total size in use of the etcd database. dbSizeFree:   Total size not in use of the etcd database, defined as dbSize - dbSizeInUse. dbQuota:      etcd storage quota in bytes (the value passed to etcd instance by flag --quota-backend-bytes). dbQuotaUsage: Total usage of the etcd storage quota, defined as dbSize/dbQuota.  dbQuota needs to be passed as etcdStorageQuotaBytes.  By default, we defragment if the quota usage is greater than 80% and the unused space makes up 10% of the quota. |
| endpoints | list | `["https://127.0.0.1:2379"]` | etcd endpoints. |
| etcdStorageQuotaBytes | int | `8589934592` | etcd storage quota in bytes (defaults to 8Gi). |
| hostNetwork | bool | `true` | Wheter to use host network or not. |
| image | object | `{"image":"giantswarm/etcd-defrag","pullPolicy":"IfNotPresent","registry":"gsoci.azurecr.io","tag":""}` | Image settings. |
| image.image | string | `"giantswarm/etcd-defrag"` | Image name. |
| image.pullPolicy | string | `"IfNotPresent"` | Image pull policy. |
| image.registry | string | `"gsoci.azurecr.io"` | Image registry. |
| image.tag | string | `""` | Image tag (defaults to .Chart.AppVersion). |
| imagePullSecrets | list | `[]` | Image pull secrets. |
| jobAnnotations | object | `{}` | Job annotations. |
| jobLabels | object | `{}` | Job labels. |
| labels | object | `{}` | Common labels. |
| moveLeader | bool | `true` | Whether to move the leadership before performing defragmentation on the leader or not. |
| nodeSelector | object | `{}` | Node selector. |
| podAnnotations | object | `{}` | Pod annotations. |
| podLabels | object | `{}` | Pod labels. |
| podSecurityContext | object | `{}` | Pod security context. |
| policyException | object | `{"namespace":""}` | Policy exception settings. |
| policyException.namespace | string | `""` | Namespace. Useful for when policy exceptions are meant to be installed in a different namespace. |
| resources | object | `{"limits":{"memory":"128Mi"},"requests":{"cpu":"100m","memory":"128Mi"}}` | Resource requests & limits. |
| restartPolicy | string | `"OnFailure"` | Restart policy. |
| schedule | string | `"0 * * * *"` | Cron schedule. |
| securityContext | object | `{"allowPrivilegeEscalation":false,"capabilities":{"drop":["ALL"]},"readOnlyRootFilesystem":true,"runAsGroup":0,"runAsNonRoot":false,"runAsUser":0,"seccompProfile":{"type":"RuntimeDefault"}}` | Container security context. |
| tolerations | list | `[{"effect":"NoSchedule","key":"node-role.kubernetes.io/control-plane"},{"effect":"NoExecute","operator":"Exists"}]` | Tolerations. |
| useClusterEndpoints | bool | `true` | Whether to use all endpoints from the cluster member list or not. |
