### Create a file system

```bash
ceph osd pool create cephfs_data
ceph osd pool create cephfs_metadata

ceph fs new cephfs cephfs_metadata cephfs_data
```
### Create subvolume for Kuberentes:

```bash
sudo ceph fs subvolumegroup create cephfs csi
sudo ceph fs subvolumegroup ls cephfs
```