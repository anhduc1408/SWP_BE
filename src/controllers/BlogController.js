const BlogService = require("../services/BlogService");

const Blog = {
    getAllBlogs: async (req, res) => {
        try {
            const blogs = await BlogService.getAllBlogs();
            return res.status(200).json(blogs);
        } catch (error) {
            console.error(error);
            res.status(500).json({ error: "Lỗi khi lấy danh sách blog!" });
        }
    },

    getBlogById: async (req, res) => {
        try {
            const { blogID } = req.params;
            const blog = await BlogService.getBlogById(blogID);
            return res.status(200).json(blog);
        } catch (error) {
            console.error(error);
            res.status(500).json({ error: "Lỗi khi lấy blog!" });
        }
    },

    getBlogByCategory: async (req, res) => {
        try {
            const { categoryID } = req.params;
            const blog = await BlogService.getBlogsByCategory(categoryID);
            return res.status(200).json(blog);
        } catch (error) {
            console.error(error);
            res.status(500).json({ error: "Lỗi khi lấy blog!" });
        }
    },

    getBlogCategories: async (req, res) => {
        try {
            const categories = await BlogService.getBlogCategories();
            
            if (!categories || categories.length === 0) {
                console.log('Không có danh mục');
                return res.status(404).json({ error: "Không tìm thấy thư mục nào!" });
            }

            console.log('Danh sách thư mục:', categories);
            return res.status(200).json(categories);
        } catch (error) {
            console.error(error);
            res.status(500).json({ error: "Lỗi khi lấy danh sách thư mục!" });
        }
    },

    createBlog: async (req, res) => {
        try {
            const { title, content, category } = req.body;
            const blog = await BlogService.createBlog(title, content, category);
            return res.status(200).json(blog);
        } catch (error) {
            console.error(error);
            res.status(500).json({ error: "Lỗi khi tạo blog!" });
        }
    },

    updateBlog: async (req, res) => {
        try {
            const { blogID } = req.params;
            const { title, content, category } = req.body;
            const blog = await BlogService.updateBlog(blogID, title, content, category);
            return res.status(200).json(blog);
        } catch (error) {
            console.error(error);
            res.status(500).json({ error: "Lỗi khi cập nhật blog!" });
        }
    },

    deleteBlog: async (req, res) => {
        try {
            const { blogID } = req.params;
            const blog = await BlogService.deleteBlog(blogID);
            return res.status(200).json(blog);
        } catch (error) {
            console.error(error);
            res.status(500).json({ error: "Lỗi khi xóa blog!" });
        }
    }
}

module.exports = Blog