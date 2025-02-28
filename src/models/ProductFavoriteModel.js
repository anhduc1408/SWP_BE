const pool = require("../config/Database");

const ProductFavoriteModel = {
    postAddProductIDTym: async (customerID, categoryLove, productIDTym) => {
        try {
            // ✅ Kiểm tra xem dữ liệu đã tồn tại chưa
            const [existingRows] = await pool.query(`
                SELECT * FROM ProductFavorite
                WHERE CustomerID = ? AND CategoryFavorite = ? AND ProductID = ?
            `, [customerID, categoryLove, productIDTym]);

            if (existingRows.length > 0) {
                return { message: "Sản phẩm đã có trong danh sách yêu thích." };
            }

            // ✅ Nếu chưa có thì thêm mới
            const [result] = await pool.query(`
                INSERT INTO ProductFavorite (CustomerID, CategoryFavorite, ProductID, AddedDate)
                VALUES (?, ?, ?, NOW())
            `, [customerID, categoryLove, productIDTym]);


            return { message: "Thêm sản phẩm yêu thích thành công!", insertedId: result.insertId };

        } catch (error) {
            console.error("Lỗi truy vấn MySQL:", error);
            return { error: "Lỗi server, vui lòng thử lại sau." };
        }
    }
};

module.exports = ProductFavoriteModel;
