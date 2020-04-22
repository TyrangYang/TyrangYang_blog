---
title: Redis overview
date: 2019-10-15
author: Haolin Yang
categories: ["Overview"]
tag:
    - web
    - redis
---

## Installation

For mac

```
sudo brew install redis-server
```

open redis server

```
redis-server
```

test is work or not

```
redis-cli ping
```

## basic command

```
ECHO 'hello word

QUIT
```

```
SET foo 100

GET foo // 100

SET bar 'hello world'

GET bar // hello world

INCR foo // 101

DECR foo // 100

EXISTS foo // 1

EXISTS foo1 // 0

DEL bar

EXISTS bar // 0

GET bar //(nir)

FLUSHALL // all empty

SET server:name someserver

GET server:name // "someserver"

SET server:port 8000

GET server:port

SET greeting "Hello world"

GET greeting

EXPIRE greeting 50  // set expirations to 50 second

TTL greeting

SETEX greeting 30 "hello world" // set value and expiration

PERSIST greeting // key will not expire

TTL greeting // -1

MSET key1 "hello" key2 "world"

APPEND key1 " world"

RENAME key1 greeting

LPUSH people "Brad" // 1

LPUSH people "Jen" // 2

LPUSH people "Tom" // 3

LRANGE people 0 -1 // return all // Tom Jen Brad

LRANGE people 1 2 // Jen Brad

RPUSH people "Harry"

LRANGE people 0 -1 // Tom Jen Brad Harry

LLEN people // 4

RPOP people // Harry

LPOP people

LINSERT people BEFORE "Brad" "TOM"

LRANGE people 0 -1 // Jen Tom Brad

SADD cars "Ford"

SADD cars "Honda"

SADD cars "BMW"

SISMEMBER cars "Ford" // 1

SISMEMBER cars "Chevy" // 0

SMEMBER cars // Honda BMW Ford

SCARD cars // 3

SMOVE cars mycars "Ford"

SMEMBER cars // Honda BMW

SMEMBER mycars // Ford

SRAM cars "BMW"

SMEMBER cars // Honda

ZADD users 1980 "Brad"

ZADD users 1975 "Jen"

ZADD users 1990 "Mike"

ZADD users 1990 "Kate"

ZRANK users "Mike" // 3

ZRANK users "Jen" // 0

ZRANK users "Brad" // 1

ZRANGE users 0 -1 // Jen Brad Kate Mike

ZINCRBY users 1 "Jen" // 1976

HSET user:brad name "Brad"

HSET user:brad email "brad@gmail.com"

HGET user:brad name

HGET user:brad email

HGETALL user:brad

HMSET user:john name "Jen" email "jen@yahoo.com" age "25"

HGETALL user:john

HKEYS user:john

HVAL user:john

HINCERBY user:john age 1 // 26

HDEL user:john age // 1

HLEN user:john // 2

SAVE

```
