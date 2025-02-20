const pool = require("../config/Database");

const Notifications = {
  getAddNotifications: async (OrderInfor, voucher, totalPayment, cusID) => {
    try {
      // Kiểm tra xem thông báo đã tồn tại chưa
      const [existingRows] = await pool.query(
        "SELECT * FROM Notifications WHERE customer_id = ? AND order_id = ? AND voucher_id = ?",
        [cusID, OrderInfor.OrderID, voucher.VoucherID]
      );

      // Nếu thông báo đã tồn tại, không chèn thêm
      if (existingRows.length > 0) {
        console.log("Notification already exists");
        return { message: "Notification already exists", data: existingRows };
      }

      // Nếu chưa tồn tại, thực hiện INSERT
      const [result] = await pool.query(
        `INSERT INTO Notifications (customer_id, order_id, voucher_id, status, created_at) 
                 VALUES (?, ?, ?, ?, NOW())`,
        [cusID, OrderInfor.OrderID, voucher.VoucherID, "unread"]
      );

      return {
        message: "Notification inserted successfully",
        insertId: result.insertId,
      };
    } catch (error) {
      console.error("Error inserting notification:", error);
      throw error;
    }
  },

  getAllNotifications: async (req, res) => {
    try {
      const customerID = req.query.customerID;
      const type = req.query.typeNotification;

      if (!customerID) {
        return res.status(400).json({ message: "customerID is required" });
      }

      if (type === "Tất Cả Thông Báo") {
        const [result] = await pool.query(
          `SELECT 
                      o.CustomerID,
                      o.OrderID,
                      o.Status,
                      o.ActualDeliveryTime,
                      p.ProductImg,
                      v.VoucherImg,
                      v.IsActive,
                      v.StartDate,
                      v.EndDate,
                      v.VoucherName,
                      v.VoucherTitle
                  FROM Orders o
                  LEFT JOIN OrderDetail od ON o.OrderID = od.OrderID
                  LEFT JOIN Product p ON od.ProductID = p.ProductID
                  LEFT JOIN VoucherDetail vd ON o.CustomerID = vd.CustomerID
                  LEFT JOIN Voucher v ON vd.VoucherID = v.VoucherID
                  WHERE o.CustomerID = ?
                  GROUP BY o.CustomerID, o.OrderID, v.VoucherID, p.ProductImg
                  ORDER BY o.ActualDeliveryTime DESC
                  Limit 10;`,
          [customerID]
        );

        return result;
      } else if (type === "Cập Nhật Đơn Hàng") {
        const [result] = await pool.query(
          `SELECT 
            o.CustomerID,
            o.OrderID,
            o.Status,
            o.ActualDeliveryTime,
            GROUP_CONCAT(DISTINCT p.ProductImg SEPARATOR ', ') AS ProductImgs
            FROM Orders o
            LEFT JOIN OrderDetail od ON o.OrderID = od.OrderID
            LEFT JOIN Product p ON od.ProductID = p.ProductID
            WHERE o.CustomerID = ?
            GROUP BY o.CustomerID, o.OrderID
            ORDER BY o.ActualDeliveryTime DESC
            LIMIT 10;`,
          [customerID]
        );

        console.log("type: ", type);
        console.log("Type Down hangf: ", result);

        return result;
      }else if (type === "Khuyến Mãi") {
        const [result] = await pool.query(
          `SELECT 
              o.CustomerID,
              o.OrderID,
              o.Status,
              o.ActualDeliveryTime,
              v.VoucherImg,
              v.IsActive,
              v.StartDate,
              v.EndDate,
              v.VoucherName,
              v.VoucherTitle
              FROM Orders o
              LEFT JOIN VoucherDetail vd ON o.CustomerID = vd.CustomerID
              LEFT JOIN Voucher v ON vd.VoucherID = v.VoucherID
              WHERE o.CustomerID = ?
              GROUP BY o.CustomerID, o.OrderID, v.VoucherID
              ORDER BY o.ActualDeliveryTime DESC
              LIMIT 10;`,
          [customerID]
        );

        console.log("type: ", type);
        console.log("Type Down hangf: ", result);

        return result;
      }
    } catch (error) {
      console.error("Error fetching notifications:", error);
      throw error;
    }
  },
};
module.exports = Notifications;
