const express = require('express');
const orderRouter = require('./src/routers/OrderRouter')
const cartRouter = require('./src/routers/CartRouter')
const app = express();
const cors = require('cors');

const port = 3001;
app.use(express.json());
app.use(cors());

app.use('/api/Order',orderRouter)
app.use('/api/Cart',cartRouter)

app.listen(port,() => {
    console.log(`Example app listening on port ${port}`)
  });