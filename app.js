const express = require('express');
const Order = require('./src/routers/OrderRouter')
const Cart = require('./src/routers/CartRouter')
const app = express();
const cors = require('cors');

const port = 3001;
app.use(express.json());
app.use(cors());

app.get('/api/Order', Order)
app.get('/api/Cart', Cart)

app.listen(port,() => {
    console.log(`Example app listening on port ${port}`)
  });