const BlogModel = require("../models/BlogModel");

const Blog = {
    getAllBlogs: async () => {
        return await BlogModel.getAllBlogs()
    },

    getBlogById: async (BlogID) => {
        return await BlogModel.getBlogById(BlogID)
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