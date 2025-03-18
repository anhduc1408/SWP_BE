const AffiliateTrackingModel = require("../models/AffiliateTrackingModel");

const AffiliateTrackingService = {
    // 📌 Lấy thống kê tiếp thị của khách hàng
    getAffiliateStats: async (customerId) => {
        const data = await AffiliateTrackingModel.getAffiliateStatsByCustomer(customerId);
        return data.length > 0 ? data : null;
    },

    // 📌 Xử lý nhập mã tiếp thị từ người khác
    trackAffiliateClick: async (customCode) => {
        const referrerId = await AffiliateTrackingModel.getReferrerByCode(customCode);
        if (!referrerId) return null;

        await AffiliateTrackingModel.increaseClickCount(customCode);
        await AffiliateTrackingModel.addRewardsToReferrer(referrerId, 100); // Cộng 100 xu mỗi lần click

        return { referrerId, amount: 100 };
    }
};

module.exports = AffiliateTrackingService;
