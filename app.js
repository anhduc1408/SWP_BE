const express = require('express');
const Products = require('./src/routers/productRouter')
const orderRouter = require('./src/routers/OrderRouter')
const cartRouter = require('./src/routers/CartRouter')
const VoucherRouter = require('./src/routers/VoucherRouter')
const app = express();
const cors = require('cors');

const port = 3001;
app.use(express.json());
app.use(cors());


//http://localhost:3001/api/Order/CheckOut
app.use('/api/Order',orderRouter)
app.use('/api/Cart',cartRouter)
app.use('/api/Voucher',VoucherRouter)
app.use('/api/Products', Products)
app.listen(port,() => {
    console.log(`Example app listening on port ${port}`)
  });