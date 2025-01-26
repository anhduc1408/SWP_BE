const express = require('express');
const app = express();
const port = 3001;

app.get('/',(req,res)=>{
    res.send('heheheh cc ')
})

app.listen(port,() => {
    console.log(`Example app listening on port ${port}`)
  });