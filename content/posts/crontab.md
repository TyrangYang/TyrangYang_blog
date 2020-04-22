---
title: Crontab overview
date: 2020-01-23
author: Haolin Yang
categories: ["Terminal"]
tag:
    - terminal
    - crontab
---

## What is crontab

Crontab is a toll to schedule commands. You can run your terminal command on a specific schedule like run a command every day or every weekends.

## Basic command

crontab [-u *user*] {-l | -e | -r}

| command |       utility        |
| :-----: | :------------------: |
|   -l    |  list your cron job  |
|   -r    | remove your cron job |
|   -e    |  edit your cron job  |
|   -u    |   specific a user    |

## How to schedule a command

Cron job looks like:

```
# ┌───────────── minute (0 - 59)
# │ ┌───────────── hour (0 - 23)
# │ │ ┌───────────── day of month (1 - 31)
# │ │ │ ┌───────────── month (1 - 12)
# │ │ │ │ ┌───────────── day of week (0 - 6) (Sunday to Saturday;
# │ │ │ │ │                                       7 is also Sunday on some systems)
# │ │ │ │ │
# │ │ │ │ │
# * * * * *  command_to_execute

# export date into a file every minutes
* * * * * date >> ~/Desktop/test.txt

# Mon to Fri, 2:00, 2:30 , 4:00, 4:30
*/30 2,4 * * 1-5 echo "hello world"
```

| symbol |       meaning        |
| :----: | :------------------: |
|   \*   |      any value       |
|   ,    | value list separator |
|   -    |    range of value    |
|   /    |     step values      |

## crontab.guru

[crontab.guru](https://crontab.guru) which is a website to check whether your schedule is correct.

## Reference

Thanks [Corey Schafer](https://www.youtube.com/watch?v=QZJ1drMQz1A)'s video
