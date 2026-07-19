# 网络课学习


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

##### 请求行

##### 请求头

##### 请求体

