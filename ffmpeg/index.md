# Ffmpeg


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

