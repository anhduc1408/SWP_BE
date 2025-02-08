const productControllers = require('../controllers/ProductController');

const express = require('express')

const router = express.Router();

router.get('/All',productControllers.getAllProducts);
router.get('/All/New',productControllers.getAllProductsNew);
router.get('/Category',productControllers.getAllCategory);

module.exports = router;
