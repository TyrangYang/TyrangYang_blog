---
title: 'Webpack Overview'
date: 2020-09-09T19:12:38-07:00
Categories: ['Overview']
tags: ['webpack']
toc:
    enable: true
    auto: true
linkToMarkdown: true
math:
    enable: false
---

webpack is a static module bundler for modern JavaScript applications.

Document: https://webpack.js.org/concepts/

## webpack core concept

### Entry

An entry point indicates which module webpack should use to begin building out its internal dependency graph. webpack will figure out which other modules and libraries that entry point depends on (directly and indirectly).

### Output

The output property tells webpack where to emit the bundles it creates and how to name these files. It defaults to ./dist/main.js for the main output file and to the ./dist folder for any other generated file.

### Loaders

Out of the box, webpack only understands JavaScript and JSON files. Loaders allow webpack to process other types of files and convert them into valid modules that can be consumed by your application and added to the dependency graph.

### Plugin

While loaders are used to transform certain types of modules, plugins can be leveraged to perform a wider range of tasks like bundle optimization, asset management and injection of environment variables.

### Mode

By setting the mode parameter to either `development`, `production` or `none`, you can **_enable webpack's built-in optimizations_** that correspond to each environment

## Example

In `webpack.config.js`

```js
const debug = process.env.NODE_ENV !== 'production';
const webpack = require('webpack');
const path = require('path');

module.exports = {
    mode: 'development',
    context: path.join(__dirname, 'src'),
    devtool: debug ? 'inline-sourcemap' : false,
    entry: './js/client.js',
    module: {
        rules: [
            {
                test: /\.jsx?$/,
                exclude: /(node_modules|bower_components)/,
                loader: 'babel-loader',
                query: {
                    presets: ['react', 'es2015', 'stage-0'],
                    plugins: [
                        'react-html-attrs',
                        'transform-decorators-legacy',
                        'transform-class-properties',
                    ],
                },
            },
        ],
    },
    output: {
        path: __dirname + '/src/',
        filename: 'client.min.js',
    },
    plugins: debug
        ? []
        : [
              new webpack.optimize.DedupePlugin(),
              new webpack.optimize.OccurrenceOrderPlugin(),
              new webpack.optimize.UglifyJsPlugin({
                  mangle: false,
                  sourcemap: false,
              }),
          ],
};
```
