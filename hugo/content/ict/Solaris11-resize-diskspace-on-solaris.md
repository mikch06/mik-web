--- 
date: 2015-08-15 00:00:00
categories:
- solaris
tags: 
- Solaris11
 -Unix-zfs
---
# Resize Disk Space on Solaris 

    format -e
    # growfs -M /mount-point /dev/md/rdsk/volumename
    # growfs -M /home2 /dev/md/rdsk/d10
    zfs set volsize=5G rpool/swap
    swap -a /dev/zvol/dsk/rpool/swap