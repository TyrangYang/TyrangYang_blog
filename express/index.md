# Express Overview


Express.js is a web framework for Node.js

## Example

```js
const express = require('express');

const app = express();

app.use(...); // get and post or middle ware

app.get('/', (req, res) => {
    return res.send({hello:"world"});
})

const PORT = 4000;
app.listen(PORT, ()=> {
    console.log(`Server is ready on http://localhost:${PORT}`);
})
```

