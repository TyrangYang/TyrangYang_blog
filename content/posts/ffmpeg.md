---
title: 'Ffmpeg'
date: 2023-03-12T14:48:36-07:00
Categories: ['Overview']
tags: ['overview', 'video', 'ffmpeg']
toc:
    enable: true
    auto: true
linkToMarkdown: true
math:
    enable: false
---

## Reference

{{< figure src="/images/ffmpeg/ffmpeg.png">}}

### official

https://ffmpeg.org

### blog

https://fireship.io/lessons/ffmpeg-useful-techniques/

### node js

https://www.npmjs.com/package/fluent-ffmpeg

## example

### concatenate

> ffmpeg -f concat -i vids.txt -c copy out.mp4

vids.txt:

```t
file 'name1.mov'
file 'name2.mov'
file 'name3.mov'
```

### type convention

> ffmpeg -i in.mp4 out.mov
