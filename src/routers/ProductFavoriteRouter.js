const ProductFavoriteController = require('../controllers/ProductFavoriteController');
const express = require('express')

const router = express.Router();
router.get('/AddProductIDTym',ProductFavoriteController.postAddProductIDTym);

module.exports = router