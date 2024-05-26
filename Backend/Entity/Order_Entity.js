const mongoose = require('mongoose');

// Define the order schema
const orderSchema = new mongoose.Schema(
    {
        uid: { type: String, required: true },
        orders: [{
            orderId: { type: String, required: true },
            date: { type: Date, required: true },
            time: { type: String, required: true },
            paymentMethod : { type: String, required: true },
            totalCost: { type: Number, required: true },
            gst: { type: Number, required: true },
            itemAmount: { type: Number, required: true },
            deliveryCharge: { type: Number, required: true },
            convinenceFee: { type: Number, required: true },
            orderByid: { type: String, required: true },
            orderByName: { type: String, required: true },
            status: { type: String, required: true },
            deliveryAddress: { type: String, required: true },
            items: [{
                itemId: { type: String, required: true },
                itemName: { type: String, required: true },
                itemQuantity: { type: Number, required: true },
                unitCost: { type: Number, required: true }
            }]
        }]
    });




module.exports = { orderSchema };