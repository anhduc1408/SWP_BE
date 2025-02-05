const productControllers = require('../controllers/productController')

const express = require('express')

const router = express.Router();


router.get('/All/New',productControllers.getAllProductsNew);
router.get('/Category',productControllers.getAllCategory);

module.exports = router;
