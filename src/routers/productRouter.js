const productControllers = require('../controllers/productController');
const OrderControllers = require('../controllers/productController')
const express = require('express')

const router = express.Router();

router.get('/All',productControllers.getAllProducts);
router.get('/All/New',productControllers.getAllProductsNew);
router.get('/Category',productControllers.getAllCategory);
router.post('/Search',productControllers.searchProduct);
router.post('/Favorite',productControllers.setProductFavorite);
router.post('/Favorite/getAll',productControllers.getProductFavorite);




module.exports = router;
