const mongoose = require('mongoose');
const {orderSchema} = require('../Entity/Order_Entity');

const createOrder = async (req, res) => {
    const orderData = req.body;
    try {
        const db = mongoose.connection.useDb("NukkadFoods");
        const OrderModel = db.model('Order', orderSchema);
        const order = new OrderModel(orderData);
        const savedOrder = await order.save();

        return res.json({ message: "Order created successfully", order: savedOrder });
    } catch (error) {
        console.error("Error while creating order:", error);
        return res.status(500).json({ message: "Internal server error" });
    } finally {
        
    }
};

const getOrder = async (req, res) => {
    try {

       
        // Connect to the MongoDB database
        const db = mongoose.connection.useDb("NukkadFoods");
        const Order = db.model('Order', orderSchema);

        // Fetch all orders from the "orders" collection
        const orders = await Order.find({});

        // Return the orders as JSON response
        return res.json({ orders });
    } catch (error) {
        console.error("Error while fetching orders:", error);
        return res.status(500).json({ message: "Internal server error" });
    } finally {
        
    }
}

const getOrderById = async (orderId) => {
    try {
        // Connect to the MongoDB database
        const db = mongoose.connection.useDb("NukkadFoods");
        const Order = db.model('Order', orderSchema);

        // Find the order by ID
        const order = await Order.find({ orderId: orderId });

        return order;
    } catch (error) {
        console.error("Error while fetching order by ID:", error);
        throw error;
    } finally {
        // Disconnect from the MongoDB database
       
    }
};

// Function to update order by ID
const updateOrderById = async (orderId, updateData) => {
    try {
        // Connect to the MongoDB database
        const db = mongoose.connection.useDb("NukkadFoods");
        const Order = db.model('Order', orderSchema);

        // Find the order by ID and update it
        const updatedOrder = await Order.findOneAndUpdate({ orderId: orderId }, updateData, { new: true });

        return updatedOrder;
    } catch (error) {
        console.error("Error while updating order by ID:", error);
        throw error;
    } finally {
        // Disconnect from the MongoDB database
       
    }
};


module.exports = { createOrder , getOrder , getOrderById , updateOrderById};