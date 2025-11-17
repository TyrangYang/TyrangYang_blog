---
title: Understanding SSR
date: 2025-10-20
author: Haolin Yang
categories: ['Note']
tags:
  - react
toc:
  enable: true
  auto: false
linkToMarkdown: true
math:
  enable: false
---

## Why need Server site rendering

**SEO !!** + little bit meaningful first rendering

SSR is larger concept to react. If we take about SSR only, it need to compare with SPA not React.

While when using react to do the SSR. Very basic thought is like every route is SPA. How about write react only and make it become a SSR? Nextjs coming in.

## hydration does

make page alive

### old way < next.js13

each route send full html and react and hydration function

1. server return react once. form html
2. send that html with react bundler and hydration function.
3. client did hydration
   1. here is why server and client could miss match
4. client handle the rest of user interaction

Server → Client
The server sends:

- The rendered HTML
- The React bundle (JS)
- The hydration entry function (ReactDOM.hydrate)
- The serialized props/data (**NEXT_DATA**)

```html
<body>
  <div id="__next">
    <main>
      <h1>Hello</h1>
      <button>Click</button>
    </main>
  </div>
  <script id="__NEXT_DATA__">
    {"props":{...}}
  </script>
  <script src="/_next/static/chunks/main.js"></script>
</body>
```

Client: Hydrate Entire Tree
The browser downloads the JS, then:

1. Recreates the same React tree (<App />)
2. Compares it to existing DOM (server HTML)
3. Hydrates (attaches events)

```js
ReactDOM.hydrateRoot(document.getElementById('__next'), <App {...props} />);
```

⚠️ If the rendered HTML doesn’t match the client-rendered version,
React shows a hydration mismatch warning and re-renders that part.

### new way App Router — Next.js 13+

App Router — Next.js 13+

1. Server: Split Components find client component boundary.
2. sever process server or client component and send them through http link like a flow.
3. client take html with some placeholder and start hydrated by chunk
   1. only client component will hydrated. rest part will be static html
4. client take over.

1️⃣ Server: Split Components
Next.js separates Server Components and Client Components before rendering.
Server Components are rendered on the server to HTML.
Client Components are not rendered — instead, placeholders and component references are embedded.
Example:

```html
<div>
  <h1>Post List</h1>
  <div>Server rendered post 1</div>
  <div>Server rendered post 2</div>
  <!-- client component placeholder -->
  <div data-rsc-id="L1"></div>
</div>
```

2️⃣ Server: Send HTML + React Flight Stream
Instead of sending **NEXT_DATA**, the server streams:

- HTML (from Server Components)
- React Flight data (JSON describing component tree)
- JS bundles only for "use client" components

```html
<body>
  <div id="__next">
    <main>Server-rendered HTML here...</main>
  </div>

  <script>
    self.__next_f.push(["stream_chunk", {...React Flight JSON...}])
  </script>
  <script src="/_next/static/chunks/app/List.js"></script>
</body>
```

3️⃣ Client: Progressive Reconstruction
When the browser receives the page:

1. React parses the streamed React Flight data → reconstructs the full component tree (server + client boundary).
2. For each "use client" component reference:
   - Load its JS bundle
   - Hydrate only that subtree (not entire app)
3. Other static parts (Server Components) remain as static HTML — no JS.
