const shopController = require('../controllers/ShopController');
const express = require('express');

const router = express.Router();
router.get('/',shopController.getInforShop);



module.exports = router;