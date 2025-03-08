const pool = require('../config/Database');

const Carts = {
    getAllCart:async()=>{
        const result = await pool.query('select * from Cart');
        return result[0];
    },
    getCartDetailByCusID: async(cusID)=>{
        const result = await pool.query('select * from CartDetail where CartID in (select CartID from Cart where CustomerID = ? Order by CartID)',[cusID])
        return result[0];
    },
    removeCartDetail: async (OrderInfor)=>{
        let query = 'delete from CartDetail where CartDetailID in (';
        let values = OrderInfor.map((item, index) => {
            return item.CartDetailID;
          });
          query += values.join(",");
          query += ')';
        await pool.query(query);      
    },
    updateCartDetailQuantity: async (cartID, quantity) => {
        const query = 'UPDATE CartDetail SET Quantity = Quantity + ? WHERE CartDetailID = ?';
        
        await pool.query(query, [quantity, cartID]);
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