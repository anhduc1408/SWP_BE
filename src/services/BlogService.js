const BlogModel = require("../models/BlogModel");

const Blog = {
    getAllBlogs: async () => {
        return await BlogModel.getAllBlogs()
    },

    getBlogById: async (BlogID) => {
        return await BlogModel.getBlogById(BlogID)
    },

    getBlogsByCategory: async (CategoryID) => {
        return await BlogModel.getBlogsByCategory(CategoryID)
    },

    getBlogCategories: async () => {
        const categories = await BlogModel.getBlogCategories();
        console.log("Dữ liệu danh mục từ Model:", categories);
        
        if (!categories || categories.length === 0) {
            console.log("Không có danh mục nào trong DB.");
            return [];
        }
        return categories;
    },

    createBlog: async (data) => {
        return await BlogModel.createBlog(data)
    },

    updateBlog: async (BlogID, data) => {
        return await BlogModel.updateBlog(BlogID, data)
    },

    deleteBlog: async (blogID) => {
        return await BlogModel.deleteBlog(blogID)
    }
}

module.exports = Blog