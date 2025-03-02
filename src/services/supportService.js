const SupportModel = require('../models/supportModel');

const SupportService = {
    createRequest: async (customer_id, category, subject, details) => {
        return await SupportModel.createRequest(customer_id, category, subject, details);
    },

    getUserRequests: async (customer_id) => {
        return await SupportModel.getUserRequests(customer_id);
    }
};

module.exports = SupportService;
