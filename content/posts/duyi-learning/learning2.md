---
title: '工程化'
date: 2026-03-11
author: Haolin Yang
categories: ['Posts']
tags:
  - javascript
---

## 什么是工程化

前端开发的管理工具

降低开发成本，提升开发效率

一定从宏观视角去分类和理解各种工程化工具

## 模块化和包管理

### 模块化

分解和聚合的思想。 分解契合的是主观规律。聚合契合的是客观规律。

#### 问题

对于js来讲。分开各种function和分开各种文件就是分解的直观表现。

但是对于js来说分开文件存在问题。

1. 全局污染（分解问题）

   > `1.js` 有一个`sort()`。`2.js`也有一个`sort()`
   > 同时被 html import 就会冲突

2. 依赖混乱 （聚合问题）

   > html import js是需要按照顺序的。
   > 举例 `1.js` 有一个`sort()`。`2.js`也有一个`isPrime()`。假如`sort()`依赖`isPrime()`, 那么必须先引入 `2.js` 再引入 `1.js`。
   > 如果文件足够大，那这个依赖顺序就非常复杂了。
   > 而且在 html 的角度，由于是按顺序引入，是无法看出来文件之间的依赖关系

   ```html
   <body>
     <script src="./2.js"></script>
     <script src="./3.js"></script>
     <script src="./1.js"></script>
     //cannot see 1.js is depend on 2 or 3
   </body>
   ```

#### 标准

js 社区设计了很多标准来解决这个问题。

CommonJs（CJS）- node 使用的。还大量存在

CMD AMD UMD - 很少使用

官方标准 Ecmascript Module（ESM）

##### CJS vs ESM

|   名字   |       CJS       |          ESM           |
| :------: | :-------------: | :--------------------: |
|   来源   |      民间       |          官方          |
| 设计方式 |     运行时      |         编译时         |
| 语言特点 | require('1.js') | import xxx from '1.js' |
|          |                 |                        |

#### 实现

由运行环境支持。

1. 浏览器 - ESM only

```html
<script src="./2.js" type="module"></script>
```

2. node - cjs and esm
3. 构建工具 - cjs and esm
   - webpack both
   - rollup ESM
   - esbuilder ESM

### 包管理

包：package 一系列模块的聚合

package > file > function

#### 问题

一个项目会有大量的package。那如何下载，升级，删除，发布，版本控制？

#### 标准

npm

1. package 属性 - package.json
2. registry
3. cli

pnpm vs yarn

## JS 工具链

1. API兼容 polyfill (corejs). 例如：没有a.flatMap. 就是写一个 Array.prototype.flatMap
2. 语法兼容/语法增强 syntax transformer。例如：不认识async

语法兼容 一般只能一次处理一个问题（await/spread operator/。。。）

那我需要个工具链一次处理一个。把它串联起来。

Babel @babel/preset-env

## CSS工具链

1. 语法缺失（循环，判断，拼接）
2. 功能缺失（颜色函数，数学函数，自定义函数）

当然在不断完善中

### 方法

scss/less/stylus --css预编译器--> css --后处理器-> css

postCss接受各种插件来转换css。包括(css module/autoprefixer/cssnano/purgecss)

## 构建工具和脚手架

### 构建工具

工程级别的转换

为什么要转换：可以是为了兼容性，增强，或是可维护。但**本质是开发维护的代码和运行的代码不一样**。因为开发需要便捷，运行只需要最纯粹的。

工程也是开发维护的工程和运行的工程不一样。

开发维护的工程 ---构建工具----> 运行时需要的工程

那我们需要解决的问题是：

> 1.  哪种工程更适合开发和维护
> 2.  哪种工程更适合运行
> 3.  如何打包

没有绝对的标准

webpack, rollup, esbuild

webpack 如何解决问题的呢

1. 哪种工程更适合开发和维护 ---> 一切皆是模块
2. 哪种工程更适合运行 ---> 传统工程(html/css/js)
3. 如何打包 ---> 从一个入口开始，不断寻找依赖，打包合并

入口：AST + 规则（比如index/package.json 里的main/alias）
开发服务器：通过命令`webpack serve`
文件指纹

1. express构建一个服务器（在内存打包->浏览器地址->浏览器访问->浏览器向server请求信息->server返回内存中打包结果）
2. 检测源代码 源代码变化->页面刷新 (通过websocket)

### 脚手架

vite create-react-app

1. 交互界面 cli
2. 工程模版
