--- 
title: Checkmk check podman containers
date: 2024-12-02
lastmod: 
categories: 
- checkmk
tags: 
- checkmk
- linux
- monitoring
- localcheck
---
Checkmk local script:

    # /usr/lib/check_mk_agent/local/check_podman.sh
	#!/bin/bash
	# Podman check
	# mik, 2024.11.29

	# Podman user
	puser=admin

	# Container overview
	ncont=$(su - $puser -c "podman info|grep -A 4 containerStore"|head -2|tail -1|awk {'print $2'})
	rcont=$(su - $puser -c "podman info|grep -A 4 containerStore"|head -4|tail -1|awk {'print $2'})
	scont=$(su - $puser -c "podman info|grep -A 4 containerStore"|head -5|tail -1|awk {'print $2'})

	# Checks: Images, Containers, Volumes
	images=$(su - $puser -c "podman system df"|head -2|tail -1|awk {'print $4'})
	containers=$(su - $puser -c "podman system df"|head -3|tail -1|awk {'print $4'})
	volumes=$(su - $puser -c "podman system df"|head -3|tail -1|awk {'print $5'})
