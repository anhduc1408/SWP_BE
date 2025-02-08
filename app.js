const express = require('express');
const cartRouter = require('./src/routers/CartRouter')
const app = express();
const cors = require('cors');

const port = 3001;
app.use(express.json());
app.use(cors());

app.get('/api/Cart', cartRouter)

app.listen(port,() => {
    console.log(`Example app listening on port ${port}`)
  });