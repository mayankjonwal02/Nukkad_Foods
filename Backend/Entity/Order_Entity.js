const mongoose = require('mongoose');

// Define the order schema
const orderSchema = new mongoose.Schema({
    orderId: { type: String, required: true },
    date: { type: Date, required: true },
    time: { type: String, required: true },
    orderByid: { type: String, required: true },
    orderByName: { type: String, required: true },
    status: { type: String, required: true },
    items: [{
        itemId: { type: String, required: true },
        itemName: { type: String, required: true },
        itemQuantity: { type: Number, required: true },
        unitCost: { type: Number, required: true }
    }]
});




module.exports = {orderSchema};