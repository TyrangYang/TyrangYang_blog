---
title: SSH Overview
date: 2020-04-18
author: Haolin Yang
categories: ["Overview"]
tag:
    - ssh
    - chmod
---
## ssh-keygen

`ssh-keygen`

-b specific the number of bits(1024 2048 4069)

-m specific type

-y get public key

-f specific file name

### public key

public key should give to server. Usually put in file `~/.ssh/authorized_key`

## access via SSH

`ssh <username>@<hostname | ip address>`
