# Heroku overview


Heroku can help us deploy our application(back end) rapidly and easy

## deploy

The only we need to take care is the **PORT** of your app. You have to use the **PORT** in environment.

In Node.js

```js
PORT = process.env.PORT || 3000; // 3000 can be anything else
```

## heroku cli

[Home page](https://devcenter.heroku.com/articles/heroku-cli)

`heroku login`

`heroku create`

`git push heroku master`

