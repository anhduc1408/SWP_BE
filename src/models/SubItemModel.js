const pool = require("../config/Database");

const SubItems = {
    getSubItemsByCategory: async (categoryId) => {
        const [result] = await pool.query("SELECT * FROM SubItemPortal WHERE category_id = ?", [categoryId]);
        return result;
    },

    searchSubItems: async (query) => {
        const [result] = await pool.query(
            "SELECT * FROM SubItemPortal WHERE title LIKE ? OR details LIKE ?",
            [`%${query}%`, `%${query}%`]
        );
        return result;
    }
};

module.exports = SubItems;
