--- 
date: 2025-03-12 00:00:00
title: "Proxmox: Remove subscription nag from UI"
categories: 
- proxmox
tags: 
- proxmox
- pve
---

***
Remove subscription nag from UI:

Just paste command in pve shell:

    echo "DPkg::Post-Invoke { \"dpkg -V proxmox-widget-toolkit | grep -q '/proxmoxlib\.js$'; if [ \$? -eq 1 ]; then { echo 'Removing subscription nag from UI...'; sed -i '/.*data\.status.*{/{s/\!//;s/active/NoMoreNagging/}' /usr/share/    javascript/proxmox-widget-toolkit/proxmoxlib.js; }; fi\"; };" >/etc/apt/apt.conf.d/no-nag-script
    apt --reinstall install proxmox-widget-toolkit &>/dev/null	
