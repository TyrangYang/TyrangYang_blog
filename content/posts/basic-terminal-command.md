---
title: Basic Terminal command
date: 2020-03-16
author: Haolin Yang
categories: ['Terminal']
tags:
    - terminal
---

## Basic

`cd` route

`ls` list

`pwd` show current path

`cat` concatenate and print file (usually as read file)

`touch` change file access and modification time; (usually as create file)

## Routing

`cd <directory>`

`cd .` current

`cd ..` last

`cd ~` home

`cd /` root

## List

`ls`

`ls -a` list all included hiding file

`ls -l` list detail

## Move & Copy

`cp <name1> <name2>` copy

`mv <name1> <name2>` rename

> move one file within this directory to another name.

`mv <directory1> <directory2>` move

## Find

Find a file in a dir
`find .`

`find . -type d` //only directory

`find . -type f`//only file

### name

`find . -type f -name "<filename>"`

`find . -type f -name "<partial filename>_"`

`find . -type f -iname "<partial filename>_"` -i means not case sensitive

`find . -type f -name "\*.py"`

### time

`find . -type f -mmin -10` file modify lest than 10 min

`find . -type f -mmin +10` modify more than 10 min

`find . -type f -mmin +1 -mmin -10` modify more than 1 less than 10 min

`find . -type f -mtime -20` modify less than 20 days ago

// mmin mtime // modify miniums days
// amin atime // access
// cmin ctime // change

### size

`find . -size +5M` find size larger than 5 MB

`find . -size -1G` find size smaller than 1 GB

`find . -size +2k` find size larger than 2KB (**k is lower case**)

### empty

`find . -empty` find empty file

## Grep

Find some content inside a file

`grep "find" terminal.txt` find the content inside the file or not (Eg: `findfind` will be fond)

`grep -w "find" terminal.txt` **-w** find the content exactly inside the file ofr not (Eg:`findfind` will be ignored)

`grep -iw "find" terminal.txt` **-i** not case sensitive

`grep -iwn "find" terminal.txt` **-n** show line number that find the content

`grep -iwn -B 4 "find" terminal.txt` 4 line before the match

`grep -iwn -A 4 "find" terminal.txt` 4 line after the match

`grep -iwn -C 4 "find" terminal.txt` 4 line before and after the match

`grep -iwn "find" ./*` find all files in this directory with content

`grep -winr "find" ./` -r recursive search the directory and subdirectory

`grep -wirl "find" ./` -l only show the directory of matching file.

`grep -wirc "find" ./` -c how many match in this directory.

## History

`history`

### combine with grep

`history | grep "ls"` show history have "ls"

## Curl (http request)

`curl <url>` http request

`curl -i <url>` //--include get detail

`curl -d <data> <url>` // --data post request

`curl -X PUT -d <data> <url>` // update

`curl -X DELETE <url>` //delete

`curl -u <username>:<password> <url>` // username

`curl -0 <downloadname> <url>` //download

## Short cut

`ctrl + a` //go to the beginning of a line

`ctrl + e` //go to the end of a line

`option + <- or ->` jump a word right or left

`option + click`

`ctrl + u` //delete everything before cursor 光标

`ctrl + k` //delete everything after cursor

`tab` //auto complete

`up or down` //scroll through your history command

`history` //show all history command
