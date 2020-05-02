---
title: SocketIo Overview
date: 2020-04-18
author: Haolin Yang
categories: ['Overview']
tags:
    - socketIo
    - nodejs
---

socket.io enable realtime, bidirectional communication for Nodejs

## Backend

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

## Frontend

1. bring client side socket.io in your html file

```html
<script src="/socket.io/socket.io.js"></script>
```

2. connect in your frontend script file

```js
const clientSocket = io();
```

## Function

### Receive -> on()

```js
socket.on('<head>', (data) => {
    // deal with data
});
```

### Send -> emit()

```js
socket.emit('<head>', data);
```

### Send to all client socket except itself -> socket.broadcast.emit()

```js
socket.broadcast.emit('<head>', data);
```

### Sent to all client socket include itself -> io.emit()

```js
io.emit('<head>', data);
```

### Group socket together

```js
socket.join('<name>');
```

### Send to a group

```js
socket.to('<name>').emit();
socket.broadcast.to('<name>').emit();
io.to('<name>').emit();
```
