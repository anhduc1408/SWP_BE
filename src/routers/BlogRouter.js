const express = require('express');
const BlogController = require('../controllers/BlogController');
const upload = require('../middlewares/uploadConfig');

const router = express.Router();

router.get('/', BlogController.getAllBlogs);
router.get('/:blogID', BlogController.getBlogById);
router.post('/', 
    upload.fields([
        { name: 'coverImage', maxCount: 1 },
        { name: 'images', maxCount: 20 }
    ]),
    BlogController.createBlog);
router.put('/:blogID', 
    upload.fields([
        { name: 'coverImage', maxCount: 1 },
        { name: 'images', maxCount: 20 }
    ]),
    express.json(),
    BlogController.updateBlog);
router.delete('/:blogID', BlogController.deleteBlog);

module.exports = router;