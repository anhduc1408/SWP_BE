const BlogModel = require("../models/BlogModel");

const Blog = {
    getAllBlogs: async () => {
        return await BlogModel.getAllBlogs()
    },

    getBlogById: async (BlogID) => {
        return await BlogModel.getBlogById(BlogID)
    },

    createBlog: async (data, sections, images) => {
        return await BlogModel.createBlog(data, sections, images)
    },

    updateBlog: async (BlogID, data, sections, images) => {
        return await BlogModel.updateBlog(BlogID, data, sections, images)
    },

    deleteBlog: async (blogID) => {
        return await BlogModel.deleteBlog(blogID)
    }
}

module.exports = Blog