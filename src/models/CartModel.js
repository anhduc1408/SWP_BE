const pool = require('../config/Database');

const Carts = {
    getAllCart: async () => {
        const result = await pool.query('select * from Cart');
        return result[0];
    },
    getCartDetailByCusID: async (cusID) => {
        const result = await pool.query('select * from CartDetail where CartID in (select CartID from Cart where CustomerID = ? Order by CartID)', [cusID])
        return result[0];
    },
    removeCartDetail: async (cartID) => {
        const query = 'DELETE FROM CartDetail WHERE CartDetailID = ?';
        try {
            const result = await pool.query(query, [cartID]);
            console.log(`Đã xóa ${result.affectedRows} dòng từ CartDetail`);
            return result;
        } catch (error) {
            console.error('Lỗi khi xóa dữ liệu trong CartDetail:', error);
            throw error;
        }
    },
    updateCartDetailQuantity: async (cartID, quantity) => {
        if (quantity <= 0) {
            await pool.query('DELETE FROM CartDetail WHERE CartDetailID = ?', [cartID]);
        }
            await pool.query('UPDATE CartDetail SET Quantity = ? WHERE CartDetailID = ?', [quantity, cartID]);
    },
    getCartItemById: async (cartID) => {
        const result = await pool.query('select * from CartDetail where CartDetailID = ?', [cartID]);
        if (result[0].length > 0) {
            return result[0][0];
        } else {
            return null;
        }
    },

    updateCartDetail: async (body) => {
        const {customerID, productID, quantity} = body
        const cartCurrentRecord =  await pool.query(
            "SELECT  * FROM cart WHERE CustomerID = ? ORDER BY CartID desc", [customerID]
        );

        let currentCartID = cartCurrentRecord?.[0]?.[0]?.CartID

        // TH: CHƯA CÓ CART
        if(!currentCartID){
            const [resultCart] = await pool.query(
                "INSERT INTO cart (CustomerID) values (?)", [customerID]
              );
            currentCartID = resultCart.insertId;
        }

        const cartDetailCurrentRecord =  await pool.query(
            "SELECT * FROM cartdetail WHERE CartID = ? AND ProductID = ? ORDER BY CartDetailID desc", [currentCartID, productID]
        );
console.log('cartDetailCurrentRecord', cartDetailCurrentRecord);

        let currentCartdDetailID = cartDetailCurrentRecord?.[0]?.[0]?.CartDetailID
        
        if(currentCartdDetailID){
            await pool.query(
                "UPDATE cartdetail SET Quantity = ? WHERE (CartDetailID = ? and ProductID = ?)", [ ((cartDetailCurrentRecord?.[0]?.[0]?.Quantity || 0) + quantity),currentCartdDetailID, productID]
              );
            return
        }
         await pool.query(
            "INSERT INTO cartdetail (CartID, ProductID, Quantity) values (?,?,?)", [currentCartID, productID, quantity]
          );
    },
}

module.exports = Carts;