const productControllers = require('../controllers/productController')
const express = require('express')

const router = express.Router();


router.post('/All/New',productControllers.getAllProducts);
module.exports = router;
