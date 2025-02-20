const Orders = require('../models/OrderModel');
const Voucher = require('./VoucherService')
const Cart = require('./CartService')
const Product = require('../models/ProductModel');

const OrderServices = {
    getAllOrder: async ()=>{
        return await Orders.getAllOrders();
    },
    getOrderByCusID:async(cusID)=>{
        return await Orders.getOrderByCusId(cusID)
    },
    addOrder:async (OrderInfor,voucher,totalPayment,cusID)=>{
        await Orders.addOrder(cusID,totalPayment,OrderInfor,voucher);
        await Cart.removeCartDetail(OrderInfor)
        if(voucher){
            await Voucher.removeVoucherDetail(cusID,voucher);
        }
    },
    getOrderDetailByCusID: async (cusID)=>{
        const OderDetail = await Orders.getOrderDetailByCusID(cusID);
        const result  = await Promise.all(OderDetail.map(async(item)=>{
            const query = await Product.getProductByProID(item.ProductID);
            const query1 = await Voucher.getVoucherByID(item.VoucherID)
            const tmp = {
                productID : item.ProductID,
                productCategory:query[0].Category,
                status:item.Status,
                productImg: query[0].ProductImg,
                productName:query[0].ProductName,
                description:query[0].Description,
                productPrice:query[0].Price,
                productImg: query[0].ProductImg,
                Quantity:item.Quantity,
                ShopID:query[0].ShopID,
                discount:item.discount,
                shipperID: item.ShipperID,
                feeShip: 32000,
                totalAmount: item.Quantity * query[0].Price + 32000,
            }
            // cartID: item.CartDetailID,
            //         productID: product[0].ProductID,
            //         productImg: product[0].ProductImg,
            //         productName: product[0].ProductName,
            //         productCategory: product[0].Category,
            //         ShopID: product[0].ShopID,
            //         productPrice: product[0].Price,
            //         Quantity: item.Quantity,
            //         feeShip: 32000,
            //         totalAmount: item.Quantity * product[0].Price + 32000,
            //     };
            return tmp;
        }))   
        return result;  
    }
}
module.exports = OrderServices;