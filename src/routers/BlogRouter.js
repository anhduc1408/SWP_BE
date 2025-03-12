const express = require('express');
const BlogController = require('../controllers/BlogController');

const router = express.Router();

router.get('/', BlogController.getAllBlogs);
router.get('/:blogID', BlogController.getBlogById);
router.get('/category/:categoryID', BlogController.getBlogByCategory);
router.get('/categories', BlogController.getBlogCategories);
router.post('/create', BlogController.createBlog);
router.put('/update/:blogID', BlogController.updateBlog);
router.delete('/delete/:blogID', BlogController.deleteBlog);

module.exports = router;