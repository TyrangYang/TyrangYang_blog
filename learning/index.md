# 大师课学习


## 时间循环 event loop

> [**More Detail**]({{< relref "posts/js-asynchronous.md#js-event-loop--call-stack--task-queue">}})

event loop 是浏览器上的概念。

### 进程和线程 process and thread

进程可以简单理解为内存上一块独立的空间

如果进程需要同时执行多个任务。那每个任务都可以是一个独立的线程。

浏览器是一个多进程多线程的application。浏览器非常复杂像一个操作系统。浏览器需要很多独立进程 （网络进程。浏览器进程。渲染进程。。。。。。）

浏览器进程：浏览器展示。（导航栏，收藏）。用户互动。子进程管理（启动其他进程）。进程内部会有多个线程处理不同任务。
网络进程：加载网络资源。多个线程负责同时加载多个资源
渲染进程：启动后开启一个主线程。主线程负责 html css 。 每一个标签页都是一个单独的渲染进程（将来可能是一个站点一个进程）

渲染主线程干什么：

- html解析
- 解析css
- 计算样式 em->px 优先级
- layout 长宽高
- 图层 z-index
- 每秒页面画60次 fps
- js
- event listener
- 回调函数 callback
- 。。。。。。。

那为什么不多线程呢？js 都是dom操作。大量的dom element如果被同时操作。太多lock了。lock本身的cost就不小。

#### 如何调度任务

比如用户的click 的callback。要立刻处理吗？

#### 结局办法 massage queue

渲染主线程里任务可以生成新的任务
其他线程也可以添加任务。

1. 最一开始的时候。渲染主线程会进入一个无限循环
2. 每一次循环，都是检查消息队列里有没有任务。有就取出第一个执行。没有就进入休眠
3. 所有线程（包括其他进程的线程）可以随时向message queue添加任务。

整个这个循环过程叫event loop （message loop）

### 何为异步

代码中有一些无法立即执行的任务

1. setTimeOut
2. XHR fetch
3. addEventListener
<!-- {{<figure src="/images/2020-03-17-css/position.png" title="position" width="70%" height="70%" >}} -->

阻塞
![image](/images/learning/image.png)

不阻塞
![image](/images/learning/image2.png)

### 任务优先级

任务是有优先级的。但一个队列都是FIFO。

因此实际上（w3c规范）。有很多个任务队列，同一类型的任务只能在同一队列。一个队列可以有多个类型。浏览器来决定哪个队列先被event loop提取。
但是一定有一个高优先级队列 微队列（micro queue）。任务完了之后一定先执行这个队列的全部任务。

目前chrome里至少包含三个

1. 延时队列（中优先级）。setTimeout
2. 交互队列（高）。点击，滚动，键盘，窗口
3. 微队列（最高）

添加到微队列的方法。

1. promise `Promise.resolve().then(函数)`
2. mutationObserver

### 面试问题

![image](/images/learning/image3.png)
![image](/images/learning/image4.png)
![image](/images/learning/image5.png)

单线程是异步产生的原因
时间循环是异步的实现方式

## 浏览器如何渲染的

![image](/images/learning/image-2.png)

## 渲染流水线

![image](/images/learning/render-pipeline.png)

### html解析

html => dom tree & cssom tree

> html解析过程遇到css会启动预下载器。主渲染线程不会等待，不会阻塞html。遇到js就是暂停等待下载线程完成再执行。（除非遇到async/defer）。因为js可能会修改dom tree。

`document.styleSheets` 可以访问cssom tree

### 样式计算 recalculate style

dom tree & cssom tree => dom tree with computed style (计算后的最终样式)

> 遍历dom tree给每个节点计算出最终样式 (computed style)。相对值会变成绝对值 `em`->`px`。预设值会变成真实值 `red`->`rgb(255,0,0)`

css属性值的计算过程：层叠（谁覆盖谁），继承。
视觉格式化模型：box model。block。

### 布局 layout

dom tree with computed style => layout tree (每个节点的尺寸和位置)

他们不是一一对应的。
隐藏的不在layout tree
before 会额外多出来一个

> 遍历dom tree，计算出几何信息。例如长宽高，块的位置。

#### inline box & block box

行盒和块盒不能相邻
content只能在行盒里

所以会有 Anonymous box 生成来满足要求

`document.body.clientWidth` 等等。这些都是layout tree暴露给dom tree的

### 分层 layer

主线程会使用复杂的策略给layout tree分层。

分层优势在于。一层变化只会处理当层来提升效率

z-index 滚动条 transform opacity 都可能会影响分层。不同浏览器，不同版本都可能不同。

css will-change 属性可以最大限度影响分层。（除非每一个部分变化过于频繁，才考虑分层来优化，分层过多之后会导致GPU占用过大也不是好事）

### 绘制 paint

为每一个层生成绘制指令集（canvas 就是利用 绘制指令）

### 分块 tiling

绘制之后。将每个绘制指令集交给合成线程。合成线程现将图层分块，分成更小的区域。它会从线程池里拿出多个线程来一起完成分块工作

### 光栅化 raster

交给GPU进程，把每个分块转化成位图。一般会优先处理窗口内的块。

### 画 draw

最后把位图通过合成线程，合成(Compositing)成平面图片。最后是生成quad，交给GPU执行。

transform 在这一步做个。（这就是为什么 transform效率高）

渲染进程（沙盒）

- 渲染主线程
- 合成线程

### 面试题

#### 什么是 reflow

reflow 的本质是 重新计算layout tree。（从layout开始）

你有可能是修改了dom tree。你也有可能是修改了几何信息。长宽高，位置，padding，margin。。。

为了避免多次重新计算。每当改变layout信息时，都会生成一个任务等到主线程有空一起计算。

但这导致里另一个问题。就是如果改变完了需要立刻取得其他layout的更新之后的信息，是取不到的。（因为js任务没结束。reflow任务还没执行）

经过权衡，当你有异步的reflow任务但你又读取layout。会触发强制同步布局。（Forced Synchronous Layout）也就是立刻reflow。这可能会有性能损失，但这是权衡后的结果。

#### 什么是 repaint

repaint本质是根据分层信息重新生成指令集和 （从paint开始）

reflow 一定触发repaint

#### 为什么transform高效。

因为transform只有GPU来影响。所以从draw开始。

所以redraw更快

## 什么是数据响应式 Implicit

数据的变化会自动运行一些函数。

本质上是利用object.defineProperty get set. 每一次get都会挂载 function。每一次set，都会使得function list，来run。

## react的本质 Explicit

function

UI = render(state)

```js
// 1. The Component: A pure function that returns a UI tree (Virtual DOM)
function MyComponent(state) {
  return {
    type: 'div',
    props: {
      children: [
        { type: 'h1', props: { children: state.title } },
        {
          type: 'button',
          props: {
            onClick: () => dispatch('INCREMENT'),
            children: state.count,
          },
        },
      ],
    },
  };
}

// 2. The Core Engine (The Snapshot Strategy)
let currentState = { count: 0, title: 'Hello React' };
let oldVirtualDOM = null;

function updateUI(action) {
  // Step A: Explicit State Transformation (Immutability)
  // We don't mutate. We create a brand new snapshot.
  currentState = reducer(currentState, action);

  // Step B: Re-render the entire component logic
  // "Give me the full picture of what the UI should look like now."
  const newVirtualDOM = MyComponent(currentState);

  // Step C: Reconciliation (The "Diffing" Essence)
  // Instead of observing data, we compare the old UI tree with the new one.
  const patches = diff(oldVirtualDOM, newVirtualDOM);

  // Step D: Commit
  // Only apply the calculated differences to the actual DOM.
  applyPatches(realDOM, patches);

  oldVirtualDOM = newVirtualDOM;
}
```

## 为什么需要virtual dom

virtual dom 可以说是在 code 和 dom之间，添加了额外一层。

加了一层自然就有trade off。

缺点自然是慢。

但优点，也存在。多一层其实就是的code 和dom之间解耦了decouple。这使得跨平台变得可能。（编译器也成为了可能）。

同时也使得component这一层有价值。（solidJs的component只是初始化），vdom可以定位那一块的code发生变化（component）。 多一层也使得debug工具变得可能。

### react 为什么选自Vdom

这主要是当时的历史原因。当时不同浏览器对dom的修改都不一样。不同的浏览器都是不同的平台。vdom可以说是框架的最佳选择。
并且当时browser对dom的操作本身cost很大。react是拿js（cpu）来减少reflow。（是和ajax backbone相比）

### solidJs

SolidJs 本质上只是在写启动函数。最后通过signal的概念来互责之后的UI reactive。

他不用vdom反而reflow更少，这是因为他颗粒度太细了。反而不会有太多reflow。

