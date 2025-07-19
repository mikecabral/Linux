```yaml
apiVersion: v1
kind: PersistentVolume
metadata:
  creationTimestamp: '2023-05-10T22:22:23Z'
  finalizers:
    - kubernetes.io/pv-protection
  managedFields:
    - apiVersion: v1
      fieldsType: FieldsV1
      fieldsV1:
        f:spec:
          f:accessModes: {}
          f:capacity:
            .: {}
            f:storage: {}
          f:hostPath:
            .: {}
            f:path: {}
            f:type: {}
          f:persistentVolumeReclaimPolicy: {}
          f:volumeMode: {}
      manager: agent
      operation: Update
      time: '2023-05-10T22:22:23Z'
    - apiVersion: v1
      fieldsType: FieldsV1
      fieldsV1:
        f:status:
          f:phase: {}
      manager: k3s
      operation: Update
      subresource: status
      time: '2023-05-10T22:22:23Z'
  name: jelly1
spec:
  accessModes:
    - ReadWriteMany
  storageClassName: data-jelly1
  capacity:
    storage: 1Gi
  hostPath:
    path: /usr/libexec/kubernetes/kubelet-plugins/volume/exec/
    type: ''
  persistentVolumeReclaimPolicy: Retain
  volumeMode: Filesystem
status:
  phase: Available
```


```yaml
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: jelly1
  namespace: default
spec:
  accessModes:
    - ReadWriteMany
  storageClassName: data-jelly1
  resources:
    requests:
      storage: 100Mi
```
