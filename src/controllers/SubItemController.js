const SubItemService = require("../services/SubItemService");

const SubItemController = {
    getSubItemsByCategory: async (req, res) => {
        try {
            const { categoryId } = req.params;
            if (!categoryId) {
                return res.status(400).json({ error: "Missing categoryId" });
            }
            const subItems = await SubItemService.getSubItemsByCategory(categoryId);
            res.status(200).json(subItems);
        } catch (error) {
            console.error("Error fetching sub-items:", error.message);
            res.status(500).json({ error: "Server error", details: error.message });
        }
    },

    searchSubItems: async (req, res) => {
        try {
            const { q } = req.query;
            if (!q) {
                return res.status(400).json({ error: "Missing search query" });
            }
            const subItems = await SubItemService.searchSubItems(q);
            res.status(200).json(subItems);
        } catch (error) {
            console.error("Error searching sub-items:", error.message);
            res.status(500).json({ error: "Server error", details: error.message });
        }
    }
};

module.exports = SubItemController;
