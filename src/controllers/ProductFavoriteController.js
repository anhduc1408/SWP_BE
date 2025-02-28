const ProductFavoriteService = require('../services/ProductFavoriteService');

const ProductFavoriteController = {
  
    postAddProductIDTym: async (req, res) => {
    console.log(1);
    try {
      const customerID = req.query.customerID;
      const categoryLove = req.query.categoryLove;
      const productIDTym = req.query.productIDTym;
      // Kiểm tra nếu không có shopID
      if (!customerID) {
        return res.status(400).json({ error: "Thiếu CustomerID trong request" });
      }

      if (!productIDTym) {
        return res.status(400).json({ error: "Thiếu productIDTym trong request" });
      }

      // Gọi service để lấy dữ liệu
      const result = await ProductFavoriteService.postAddProductIDTym(customerID, categoryLove, productIDTym);

      // Trả kết quả về client
      res.status(200).json(result);
    } catch (err) {
      console.error("❌ Lỗi khi lấy thông tin shop:", err);
      res.status(500).json({ error: "Lỗi server khi lấy thông tin shop" });
    }
  }
};

module.exports = ProductFavoriteController;
