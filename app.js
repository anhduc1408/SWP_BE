const express = require('express');
const Order = require('./src/routers/OrderRouter')
const Products = require('./src/routers/productRouter')
const cors = require('cors');
const app = express();
const port = 3001;

app.use(cors());
app.use(express.json());

app.get('/',Order)
app.use('/api/Products', Products)
app.listen(port,() => {
    console.log(`Example app listening on port ${port}`)
  });