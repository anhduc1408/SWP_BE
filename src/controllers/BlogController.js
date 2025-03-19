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

            if (!blog || blog.error) {
                return res.status(404).json({ error: "Blog không tồn tại!" });
            }

            return res.status(200).json(blog);
        } catch (error) {
            console.error(error);
            res.status(500).json({ error: "Lỗi khi lấy blog!" });
        }
    },

    createBlog: async (req, res) => {
        try {
            const { title, categoryID, shortDescription, customerID, sections, images } = req.body;
            const coverImage = req.file ? `uploads/${req.file.filename}` : null;

            const blogData = {
                Title: title,
                CategoryID: categoryID,
                Slug: title.toLowerCase().replace(/\s+/g, "-"),
                ShortDescription: shortDescription,
                CustomerID: customerID,
                Image: coverImage,
                sections,
                images
            };

            const blog = await BlogService.createBlog(blogData);
            return res.status(200).json(blog);
        } catch (error) {
            console.error(error);
            res.status(500).json({ error: "Lỗi khi tạo blog!" });
        }
    },

    updateBlog: async (req, res) => {
        try {
            const { blogID } = req.params;
            const { title, categoryID, shortDescription, sections, existingImages, existingCoverImage } = req.body;
            
            let Image = existingCoverImage;

            if (req.files && req.files.coverImage) {
                Image = `/uploads/${req.files.coverImage[0].filename}`;
            }

            const newImages = req.files && req.files.images ? req.files.images.map(file => `/uploads/${file.filename}`) : [];

            const allImages = [...(existingImages ? JSON.parse(existingImages) : []), ...newImages];

            await BlogService.updateBlog(blogID, {
                Title: title,
                CategoryID: categoryID,
                Slug: title.toLowerCase().replace(/\s+/g, "-"),
                ShortDescription: shortDescription,
                Image,
            }, sections, allImages);
            return res.status(200).json({ message: "Cập nhật blog thành công!" });
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