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
            const { title, categoryID, shortDescription, customerID, sections, existingImages } = req.body;
            console.log("Received blog data: ", req.body); 

            if (!title || !categoryID || !shortDescription || !customerID) {
                return res.status(400).json({ error: "Thiếu dữ liệu bắt buộc" });
            }
    
            let coverImage = req.file ? req.file.path : null;
            const images = req.files ? req.files.map(file => file.path) : [];
    
            const parsedSections = typeof sections === "string" ? JSON.parse(sections) : sections;
            const parsedExistingImages = existingImages ? JSON.parse(existingImages) : [];
            const allImages = [...parsedExistingImages, ...images];
    
            const blogData = {
                Title: title,
                CategoryID: categoryID,
                Slug: title.toLowerCase().replace(/\s+/g, "-"),
                ShortDescription: shortDescription,
                CustomerID: customerID,
                Image: coverImage || "",
                sections: parsedSections,
                images: allImages
            };
    
            console.log("Blog Data before saving: ", blogData); 
    
            const blog = await BlogService.createBlog(blogData);
            return res.status(200).json(blog);
        } catch (error) {
            console.error("Error during blog creation: ", error);
            res.status(500).json({ error: "Lỗi khi tạo blog!" });
        }
    },    

    updateBlog: async (req, res) => {
        try {
            const { blogID } = req.params;
            const { title, categoryID, shortDescription, sections, existingImages, existingCoverImage } = req.body;

            let coverImage = existingCoverImage;
            if (req.files && req.files.coverImage) {
                coverImage = req.files.coverImage[0].path;
            }

            const newImages = req.files && req.files.images ? req.files.images.map(file => file.path) : [];
            
            let oldImages = [];
            if (existingImages) {
                try {
                    oldImages = JSON.parse(existingImages);
                } catch (error) {
                    console.error("Error parsing JSON string: ", error);
                }
            }
            const allImages = [...oldImages, ...newImages];

            const parsedSections = typeof sections === "string" ? JSON.parse(sections) : sections;
            const blogData = { 
                Title: title,
                CategoryID: categoryID,
                Slug: title.toLowerCase().replace(/\s+/g, "-"),
                ShortDescription: shortDescription,
                Image: coverImage || "",
            };

            const updatedBlog = await BlogService.updateBlog(blogID, blogData, parsedSections, allImages);
            return res.status(200).json(updatedBlog);
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