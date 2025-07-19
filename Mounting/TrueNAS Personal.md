### Create .smbcred file
```bash
user=truenas
password=
domain=WORKGROUP
```

### Mount
```bash
sudo mount -t cifs -o credentials=/home/mike/.vault/.smbcred //192.168.50.154/Jellyfin /media/Jellyfin
sudo mount -t cifs -o credentials=/home/mike/.vault/.smbcred //192.168.50.154/Jellyfin2 /media/Jellyfin2
sudo mount -t cifs -o credentials=/home/mike/.vault/.smbcred //192.168.50.154/Jellyfin2/MUSIC /media/Music
```


### Fstab
```bash
//192.168.50.154/Jellyfin /media/Jellyfin cifs credentials=/home/mike/.vault/.smbcred,uid=1000,gid=1000,vers=3.0 0 0
//192.168.50.154/Jellyfin2 /media/Jellyfin2 cifs credentials=/home/mike/.vault/.smbcred,uid=1000,gid=1000,vers=3.0 0 0
//192.168.50.154/Jellyfin2/Music /media/Music cifs credentials=/home/mike/.vault/.smbcred,uid=1000,gid=1000,vers=3.0 0 0
```

### Cifs Driver for Kubernetes
https://k8scifsvol.morimoto.net.br/

#### make sure cifs-utils and jq are installed then:

```
git clone https://github.com/juliohm1978/kubernetes-cifs-volumedriver.git
cd kubernetes-cifs-volumedriver

make install
```

```yaml
apiVersion: v1
kind: PersistentVolume
metadata:
  name: Jellyfin
  namespace: default
spec:
  capacity:
    storage: 1Gi
  flexVolume:
    driver: juliohm/cifs
    options:
      opts: sec=ntlm,uid=1000
      server: my-cifs-host
      share: /media/Jellyfin
    secretRef:
      name: cifs-secret
  accessModes:
    - ReadWriteMany
```


FROM CHRISTIAN: NFS SERVER
```yaml
apiVersion: v1
kind: PersistentVolume
metadata:
  name: jellyfin
spec:
  capacity:
    storage: 500Mi
  accessModes:
    - ReadWriteMany
  storageClassName: data-jellyfin
  nfs:
    server: 192.168.50.154
    path: "/mnt/nas-jelly/Jellyfin"
```

```yaml
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: jellyfin
  namespace: default
spec:
  accessModes:
    - ReadWriteMany
  storageClassName: data-jellyfin
  resources:
    requests:
      storage: 100Mi
```



```yaml
apiVersion: v1
kind: PersistentVolume
metadata:
  name: jellyfin2
spec:
  capacity:
    storage: 500Mi
  accessModes:
    - ReadWriteMany
  storageClassName: data-jellyfin2
  nfs:
    server: 192.168.50.154
    path: "/mnt/nas-jelly/Jellyfin2"
```

```yaml
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: jellyfin2
  namespace: default
spec:
  accessModes:
    - ReadWriteMany
  storageClassName: data-jellyfin2
  resources:
    requests:
      storage: 100Mi
```




```yaml
apiVersion: v1
kind: PersistentVolume
metadata:
  name: music
spec:
  capacity:
    storage: 500Mi
  accessModes:
    - ReadWriteMany
  storageClassName: data-music
  nfs:
    server: 192.168.50.154
    path: "/mnt/nas-jelly/Jellyfin2/Music"
```


```yaml
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: music
  namespace: default
spec:
  accessModes:
    - ReadWriteMany
  storageClassName: data-music
  resources:
    requests:
      storage: 100Mi
```