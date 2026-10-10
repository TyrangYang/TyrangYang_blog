---
title: '网络课学习'
date: 2026-07-11
author: Haolin Yang
categories: ['Posts']
tags:
  - javascript
toc:
  enable: true
  auto: true
---

## 网络分层模型

### 五层模型

```
应用层 : HTTP, HTTPS, FTP, DNS, SMTP, POP3 （具体的应用是什么）
  |
传输层 : TCP, UDP （如何传输信息）
  |
网络层 : IP (ROUTER) （如何在一个互联网找到对方）
  |
数据链路层 : MAC address （如何在一个子网络找到对方）
  |
物理层 : Cable, Fiber Optic, Wireless (物理层面信号的传输方式)
```

### 应用层协议

#### URL

Uniform resource locator

```
https://a.com:80/news/details?id=123#t1

<schema>://<domain>:<port>/<path>?<query_string>#<hash_string>
```

domain: 哪个计算机
port: 端口
path: 哪个服务
query string: 参数
hash string: 和网络没太多影响

> domain port path 是必须的。
> 当http协议使用时，默认的端口是 80 时. port可以忽略
> 当https协议使用时，默认端口是 443 时. port可以忽略

#### HTTP

Hyper text transform protocol

HTTP主要就是规定了两个方面

1. 消息传输的模式 - 如何传递
2. 消息传输的格式 - 格式 规范

#### 消息传输的模式

就是简单的请求响应模式

clint request, server response

#### 消息传输的格式

![image](/images/duyi/image6.png)

[test.http](/html/test.http)

```
GET / HTTP/1.1
Host: www.taobao.com


###
POST  /posts HTTP/1.1
Host: jsonplaceholder.typicode.com
Content-Type: application/json

{
  "name": "a132",
  "age": 12
}

###
POST  /posts HTTP/1.1
Host: jsonplaceholder.typicode.com
Content-Type: application/x-www-form-urlencoded

name=a132&age=12

###
POST  /posts HTTP/1.1
Host: jsonplaceholder.typicode.com
Content-Type: multipart/form-data; boundary=aaa

--aaa
Content-Disposition: form-data; name="name"

a132
--aaa
Content-Disposition: form-data; name="age"

123
--aaa--
###
```

#### 响应吗

[Details here]({{<ref "posts/http-status-code.md">}})

## XHR & Fetch

Ajax (Asynchronous javascript and XML).

以前不让js管网络请求的事。后来才允许js管理网络请求。

两种实现方式XMLHTTPRequest和Fetch API.

|         功能         |   XHR    |       Fetch       |
| :------------------: | :------: | :---------------: |
|      请求和响应      |    ✅    |        ✅         |
|     监控请求进度     |    ✅    | ❌ (比如上传文件) |
|     监控响应进度     |    ✅    |        ✅         |
| service work是否可用 |    ❌    |        ✅         |
|   控制cookies 携带   |    ❌    |        ✅         |
|      控制重定向      |    ❌    |        ✅         |
|       请求取消       |    ✅    |        ✅         |
|    自定义referrer    |    ❌    |        ✅         |
|        stream        |    ❌    |        ✅         |
|       api风格        |  Event   |      Promise      |
|        活跃度        | 停止维护 |                   |

<!-- #### example code

[example code](/html/test.http) -->

## 同源策略和跨域问题

同源策略是一个浏览器的安全机制。同源放行，异源拒绝

源（origin） = 协议 + 域名 + 端口

异源 就是跨域了

### 跨域可能出现的场景

1. 网络通讯
   1. <a> 跳转
   2. 加载资源 css/js/image ...
   3. Ajax
   4. ...
2. JS api
   1. iframe
   2. window.open
   3. window.parent
   4. ...
3. 存储
   1. web storage (localStorage, sessionStorage ...)
   2. indexDB

浏览器对标签的跨域请求限制较少。对AJAX限制严格

### 跨域问题解决方式

1. CORS
2. JSONP
3. proxy

#### CORS

CORS的理念就是

服务器表示允许，校验通过。 服务器没提就拒绝。

但这个解决方法必须确保server是自己的。client site解决不了

首先确定是简单请求还是preflight请求

简单请求就是发出去携带`origin`。server返回response，携带`Access-Control-Allow-Origin`.如果origin判断通过。浏览器就放行。

预检请求就麻烦。先发预检请求。带上一堆其他的头。server返回复杂允许条件。必须全部满足才能放行。

#### JSONP

是CORS出现之前的方案。有点老。这个解决方法也必须确保server是自己的。client site解决不了

server响应一个函数调用。然后不用AJAX发请求。用script tag。
