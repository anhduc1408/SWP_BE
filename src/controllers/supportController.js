const SupportService = require('../services/supportService');

const SupportController = {
    createRequest: async (req, res) => {
        try {
            const { customer_id, category, subject, details } = req.body;

            if (!customer_id || !category || !subject || !details) {
                return res.status(400).json({ error: "Vui lòng điền đầy đủ thông tin." });
            }

            const request = await SupportService.createRequest(customer_id, category, subject, details);
            res.status(201).json({ message: 'Yêu cầu của bạn đã được gửi thành công!', request });
        } catch (error) {
            console.error(error);
            res.status(500).json({ error: 'Lỗi khi gửi yêu cầu!' });
        }
    },

    getUserRequests: async (req, res) => {
        try {
            const { customer_id } = req.params;

            if (!customer_id) {
                return res.status(400).json({ error: "Thiếu customer_id" });
            }

            const requests = await SupportService.getUserRequests(customer_id);
            res.status(200).json(requests);
        } catch (error) {
            console.error(error);
            res.status(500).json({ error: 'Lỗi khi lấy lịch sử yêu cầu!' });
        }
    }
};

module.exports = SupportController;
