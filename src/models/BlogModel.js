const pool = require("../config/Database");

const Blog = {
    getAllBlogs: async () => {
        const result = await pool.query('SELECT * FROM Blog ORDER BY CreatedAt DESC');
        return result[0];
    },

    getBlogById: async (blogID) => {
        const result = await pool.query('SELECT * FROM Blog WHERE BlogID = ?', [blogID]);
        return result[0].length > 0 ? result[0][0] : null;
    },

    createBlog: async (data) => {
        const { Title, Slug, ShortDescription, Content, Image, CategoryID } = data;
        const result = await pool.query('INSERT INTO Blog\n'
            + '(Title, Slug, ShortDescription, Content, Image, CategoryID, CreatedAt, UpdatedAt, Views, Likes)\n'
            + 'VALUES (?, ?, ?, ?, ?, ?, NOW(), NOW(), 0, 0)',
            [Title, Slug, ShortDescription, Content, Image, CategoryID]);
        return result;
    },

    updateBlog: async (BlogID, data) => {
        const { Title, Slug, ShortDescription, Content, Image, CategoryID } = data;
        const result = await pool.query('UPDATE Blog SET Title = ?, Slug = ?, ShortDescription = ?, Content = ?\n'
            + ', Image = ?, CategoryID = ?, UpdatedAt = NOW() WHERE BlogID = ?',
            [Title, Slug, ShortDescription, Content, Image, CategoryID, BlogID]);
        return result;
    },

    deleteBlog: async (blogID) => {
        await pool.query('DELETE FROM Blog WHERE BlogID = ?', [blogID]);
    }
}

module.exports = Blog