---
title: SocketIo Overview
date: 2020-04-18
author: Haolin Yang
categories: ['Overview']
tags:
    - socket.io
    - nodejs
---

socket.io enable realtime, bidirectional communication for Nodejs

## backend

We use **Express** as backend framework.

```js
const express = require('express');
const path = require('path');
const http = require('http');
const socket_io = require('socket.io');

const app = express();
const server = http.createServer(app);
const io = socket_io(server);

io.on('connection', (server_socket) => {
    // ...
}
```

## frontend

1. bring client side socket.io in your html file

```html
<script src="/socket.io/socket.io.js"></script>
```

2. connect in your frontend script file

```js
const clientSocket = io();
```

## function

`on()` receive

`emit()` send

`socket.broadcast.emit()` send to all client socket except itself

`io.emit()` sent to all client socket include itself

`join()` join a room

`to()` sent to some room
