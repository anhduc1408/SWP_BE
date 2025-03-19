const pool = require("../config/Database");

const Blog = {
    getAllBlogs: async () => {
        const result = await pool.query(`
            SELECT Blog.*, 
                (SELECT GROUP_CONCAT(Blogimages.ImageURL ORDER BY Blogimages.SortOrder) 
                FROM Blogimages WHERE Blogimages.BlogID = Blog.BlogID) as Images
            FROM Blog 
            ORDER BY CreatedAt DESC
        `);
        return result[0];
    },

    getBlogById: async (blogID) => {
        const result = await pool.query('SELECT * FROM Blog WHERE BlogID = ?', [blogID]);
        
        if (result[0].length === 0) {
            return { error: "Blog not found" };
        }
        const blog = result[0][0];

        const sectionsResult = await pool.query(
            `SELECT * FROM BlogSections WHERE BlogID = ? ORDER BY SortOrder`, [blogID]
        );
        blog.Sections = sectionsResult[0];

        console.log("Dữ liệu trả về từ API:", blog);

        const imagesResult = await pool.query(
            `SELECT * FROM Blogimages WHERE BlogID = ? ORDER BY SortOrder`, [blogID]
        );
        blog.Images = imagesResult[0];

        return blog;
    },

    createBlog: async (data) => {
        const { Title, Slug, ShortDescription, CategoryID, CustomerID, Image, sections, images } = data;

        const result = await pool.query(
            `INSERT INTO Blog (Title, Slug, ShortDescription, CategoryID, CustomerID, Image, CreatedAt, UpdatedAt, Views, Likes)
            VALUES (?, ?, ?, ?, ?, ?, NOW(), NOW(), 0, 0)`,
            [Title, Slug, ShortDescription, CategoryID, CustomerID, Image || ""]
        );

        const BlogID = result[0].insertId;

        if (sections && sections.length > 0) {
            for (let i = 0; i < sections.length; i++) {
                await pool.query(
                    `INSERT INTO BlogSections (BlogID, Content, SortOrder) VALUES (?, ?, ?)`,
                    [BlogID, sections[i], i + 1]
                );
            }
        }

        if (images && images.length > 0) {
            await pool.query(`DELETE FROM BlogImages WHERE BlogID = ?`, [BlogID]);
            
            for (let i = 0; i < images.length; i++) {
                if (images[i]) {  
                    await pool.query(
                        `INSERT INTO BlogImages (BlogID, ImageURL, SortOrder) VALUES (?, ?, ?)`,
                        [BlogID, images[i], i + 1]
                    );
                }
            }
        }

        return { BlogID };
    },

    updateBlog: async (BlogID, data, sections, images) => {
        const { Title, Slug, ShortDescription, CategoryID, Image } = data;

        await pool.query(
            `UPDATE Blog SET Title = ?, Slug = ?, ShortDescription = ?, CategoryID = ?, Image = ?, UpdatedAt = NOW() WHERE BlogID = ?`,
            [Title, Slug, ShortDescription, CategoryID, Image, BlogID]
        );

        if (sections && sections.length > 0) {
            await pool.query(`DELETE FROM BlogSections WHERE BlogID = ?`, [BlogID]);
            for (let i = 0; i < sections.length; i++) {
                await pool.query(
                    `INSERT INTO BlogSections (BlogID, Content, SortOrder) VALUES (?, ?, ?)`,
                    [BlogID, sections[i], i + 1]
                );
            }
        }

        if (images && images.length > 0) {
            await pool.query(`DELETE FROM BlogImages WHERE BlogID = ?`, [BlogID]);
            for (let i = 0; i < images.length; i++) {
                if (images[i]) {
                    await pool.query(
                        `INSERT INTO BlogImages (BlogID, ImageURL, SortOrder) VALUES (?, ?, ?)`,
                        [BlogID, images[i], i + 1]
                    );
                }
            }
        }
        

        return { BlogID };
    },

    deleteBlog: async (blogID) => {
        await pool.query(`DELETE FROM Blog WHERE BlogID = ?`, [blogID]);
    }
};

module.exports = Blog