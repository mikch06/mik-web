--- 
date: 2020-08-17 00:00:00
# categories: linux
tags: 
- centos
- linux
---
# CentOS8: Operations

***
### Restart Networking:

    systemctl stop NetworkManager.service
    systemctl start NetworkManager.service

OR:

    nmcli networking off
    nmcli networking on


    ->
    nmcli n off
    nmcli n on