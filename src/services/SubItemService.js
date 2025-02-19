const SubItemModel = require("../models/SubItemModel");

const SubItemService = {
    getSubItemsByCategory: async (categoryId) => {
        return await SubItemModel.getSubItemsByCategory(categoryId);
    },

    searchSubItems: async (query) => {
        return await SubItemModel.searchSubItems(query);
    }
};

module.exports = SubItemService;
