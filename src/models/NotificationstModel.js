const pool = require("../config/Database");

const Notifications = {
  getAddNotifications: async (OrderInfor, voucher, cusID) => {
    try {
      // Kiểm tra xem thông báo đã tồn tại chưa
      const [existingRows] = await pool.query(
        "SELECT * FROM Notifications WHERE customer_id = ? AND order_id = ? AND voucher_id = ?",
        [cusID, OrderInfor.OrderID, voucher.VoucherID]
      );

      // Nếu thông báo đã tồn tại, không chèn thêm
      if (existingRows.length > 0) {
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

  getAllNotifications: async (customerID, typeNotification) => {
    try {
      if (!customerID) {
        return res.status(400).json({ message: "customerID is required" });
      }
      if (!typeNotification) {
        console.log(typeNotification);
        return res
          .status(400)
          .json({ message: "typeNotification is required" });
      }
      if (typeNotification === "Cập Nhật Đơn Hàng") {
        const [result] = await pool.query(
          `SELECT DISTINCT 
    n.customer_id,
    o.OrderID,
    od.Status,
    od.DeliveryTime,
    p.ProductImg,
    o.status_Orders
FROM Notifications n
LEFT JOIN Orders o ON o.OrderID = n.order_id
LEFT JOIN OrderDetail od ON o.OrderID = od.OrderID
LEFT JOIN Product p ON od.ProductID = p.ProductID
WHERE n.customer_id = ?
ORDER BY od.DeliveryTime DESC
LIMIT 10;


`,
          [customerID]
        );
        return result;
      } else if (typeNotification === "Khuyến Mãi") {
        const [result] = await pool.query(
          `SELECT 
              v.VoucherImg,
              v.IsActive,
              vd.CustomerID,
              v.VoucherID,
              v.StartDate,
              v.EndDate,
              v.VoucherName,
              v.VoucherTitle,
              vd.status_voucherDetail
              FROM VoucherDetail vd
              LEFT JOIN Voucher v ON v.VoucherID = vd.VoucherID
              LEFT JOIN Notifications n ON vd.VoucherID = n.voucher_id
              WHERE vd.CustomerID = ?
              GROUP BY vd.VoucherID, vd.status_voucherDetail
              ORDER BY v.StartDate DESC
              LIMIT 10;`,
          [customerID]
        );

        return result;
      }
    } catch (error) {
      console.error("Error fetching notifications:", error);
      throw error;
    }
  },

  getStatusNotifications: async (
    customerID,
    order_ID,
    voucher_ID,
    statusNotification
  ) => {
    try {
      if(order_ID){
        const [result] = await pool.query(
          `UPDATE Orders
           SET status_Orders = ?
           WHERE OrderID = ?  AND CustomerID = ?;`,
          [statusNotification, order_ID, customerID]
        );
      }else {
        const [result] = await pool.query(
          `UPDATE VoucherDetail
           SET status_voucherDetail = ?
           WHERE VoucherID = ?  AND CustomerID = ?;`,
          [statusNotification, voucher_ID, customerID]
        );
      }
    } catch (error) {
      console.error("Error status notifications:", error);
      throw error;
    }
  },
  addNotifications: async (cusID, OrderID) => {
    await pool.query(
      "insert into Notifications (customer_id,order_id) values (? ,?)",
      [cusID, OrderID]
    );
  },
};
module.exports = Notifications;
