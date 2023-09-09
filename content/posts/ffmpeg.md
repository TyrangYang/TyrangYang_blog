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

### Type convention

> ffmpeg -i in.mp4 out.mov

> ffmpeg -i in.mp4 out.gif

### Scale

It very common to reduce size of output file. Change scale usually the common and efficient way to do so.

> ffmpeg -i in.mov -vf scale=960:-1 out.gif

[Reference from ffmpeg wiki](http://trac.ffmpeg.org/wiki/Scaling)
