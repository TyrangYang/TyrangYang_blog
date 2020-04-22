---
title: chmod Overview
date: 2020-04-18
author: Haolin Yang
categories: ["Overview"]
tag:
    - linux
    - chmod
    - terminal
---

chmod is linux command to control file permission

## usage

chmod [u|g|o|a][=|+|-] [r|w|x] <fileName>

u => user

g => group

o => other

a => all

r => read

w => write

x => execute

### example

`chmod +wr test.txt` give write and read permission for user

`chmod -r test.txt` remove read permission for user

`chmod g=wrx test.txt` give write, read and execute permission for group

## use number

specific the bits `011101110111` => -rwx-rwx-rwx

r = 4; w = 2; x = 1; rwx = 4+2+1; rw = 4+2

`chmod u=rwx g=rw o=x test.txt` <=> `chmod 761 test.txt`
