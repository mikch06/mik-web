--- 
date: 2022-10-26 00:00:00
title: Github access tokens
categories: 
- linux
tags: 
- github
---
Repo usage with username and password on github is deprecated.

Use Personal access tokens: <https://github.com/settings/tokens>

or: Github -> Settings -> Developer Settings -> Personal access tokens -> Tokens (classic)

## To store the token (credential) for your machine:


    git config --global credential.helper store
    (store is example)

    after that:

    git push

    Login with username and Token!

