--- 
date: 2020-07-07 00:00:00
category: centos
tags: xfs_growfs, lvextend, cryptsetup, luks, dm_crypt
---

# CentOS Cryptsetup luks / dm_crypt

Preparation:
<pre>yum -y install cryptsetup

modprobe dm_crypt
(enables crypt)

lsmod |grep dm_crypt
dm_crypt               27346  0
dm_mod                124461  11 dm_log,dm_mirror,dm_crypt
(checks crypt enabling)
</pre>
Cryptsetup:
<pre>pvcreate /dev/sdb
    Physical volume "/dev/sdb" successfully created.

vgextend centos /dev/sdb
    Volume group "system" successfully extended

lvcreate -n lv_encrypted -L 10G system
    Logical volume "lv_encrypted" created.</pre>
Cryptdevice:
<pre>
cryptsetup luksFormat /dev/system/lv_encrypted

cryptsetup luksOpen /dev/system/lv_encrypted encrypted
    
mkfs.xfs /dev/mapper/encrypted
    
mkdir /encrypted
    
mount /dev/mapper/encrypted /encrypted
    
# lsblk
NAME                    MAJ:MIN RM  SIZE RO TYPE  MOUNTPOINT
sda                       8:0    0   10G  0 disk
├─sda1                    8:1    0  512M  0 part  /boot
└─sda2                    8:2    0  9.5G  0 part
    ├─system-root         253:0    0  7.5G  0 lvm   /
    ├─system-swap         253:1    0    2G  0 lvm   [SWAP]
    └─system-lv_encrypted 253:2    0   10G  0 lvm
    └─encrypted         253:3    0   10G  0 crypt /encrypted
sdb                       8:16   0   10G  0 disk
└─system-lv_encrypted   253:2    0   10G  0 lvm
    └─encrypted           253:3    0   10G  0 crypt /encrypted
sr0      
</pre>
Increase encrypted device:<br>
(close & unmount before)
<pre>cryptsetup close encrypted
    umount /encrypted
    </pre>
extend:
<pre>lvextend -L +1GB /dev/system/lv_encrypted
cryptsetup resize /dev/mapper/encrypted
xfs_growfs /encrypted/</pre>