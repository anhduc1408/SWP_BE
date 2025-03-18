const AffiliateTrackingModel = require("../models/AffiliateTrackingModel");

const AffiliateTrackingService = {
    // Lấy dữ liệu tiếp thị theo CustomerID
    getAffiliateStats: async (customerId) => {
        return await AffiliateTrackingModel.getAffiliateStatsByCustomer(customerId);
    },

    // Lấy lịch sử tiếp thị theo CustomerID
    getAffiliateHistory: async (customerId) => {
        return await AffiliateTrackingModel.getAffiliateHistory(customerId);
    },

    // Xử lý nhập mã tiếp thị
    trackAffiliateClick: async (customCode, referredUserId) => {
        const referrerId = await AffiliateTrackingModel.getReferrerByCode(customCode);
        if (!referrerId) {
            console.error("❌ Mã tiếp thị không hợp lệ:", customCode);
            return null;
        }

        // Cập nhật lượt click và xu cho người giới thiệu
        await AffiliateTrackingModel.increaseClickCount(customCode);
        await AffiliateTrackingModel.addRewardsToReferrer(referrerId, 100);
        await AffiliateTrackingModel.saveAffiliateHistory(customCode, referredUserId);

        // Lấy tên người giới thiệu
        const referrerName = await AffiliateTrackingModel.getCustomerNameById(referrerId);
        return { referrerName, amount: 100 };
    }
};

module.exports = AffiliateTrackingService;
