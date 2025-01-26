const express = require('express');
const Order = require('./src/routers/OrderRouter')
const app = express();
const port = 3001;

app.get('/',Order)

app.listen(port,() => {
    console.log(`Example app listening on port ${port}`)
  });