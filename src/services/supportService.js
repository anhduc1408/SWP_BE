const SupportModel = require('../models/SupportModel');

const SupportService = {
    createRequest: async (customer_id, category, subject, details) => {
        return await SupportModel.createRequest(customer_id, category, subject, details);
    },

    getUserRequests: async (customer_id) => {
        const requests = await SupportModel.getUserRequests(customer_id);
        // Nếu cần lấy tên category, bạn có thể gọi thêm Service để lấy tên
        const categories = await SupportModel.getRequestCategories();
        // Thêm tên category vào các yêu cầu
        return requests.map(request => {
            const category = categories.find(cat => cat.id === request.category);
            return { ...request, category_name: category ? category.name : 'Không xác định' };
        });
    },

    getRequestById: async (id) => {
        return await SupportModel.getRequestById(id);
    },

    getRequestCategories: async () => {
        return await SupportModel.getRequestCategories();
    }
};

module.exports = SupportService;
