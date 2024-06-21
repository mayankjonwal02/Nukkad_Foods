const mongoose = require('mongoose');
const {orderSchema} = require('../Entity/Order_Entity');

const createOrder = async (req, res) => {
    const { uid, orderData } = req.body;
    try {
        const db = mongoose.connection.useDb("NukkadFoods");
        const OrderModel = db.model('Order', orderSchema);

        // Find the document with the given UID
        let userOrders = await OrderModel.findOne({ uid: uid });

        // If the document doesn't exist, create a new one
        if (!userOrders) {
            userOrders = new OrderModel({ uid: uid, orders: [] });
        }

        // Check if there is already an order with the same orderId
        const existingOrder = userOrders.orders.find(order => order.orderId === orderData.orderId);
        if (existingOrder) {
            return res.status(400).json({ message: "Order with the same orderId already exists" });
        }

        // Push the new order data into the orders array
        userOrders.orders.push(orderData);

        // Save the updated document
        const savedUserOrders = await userOrders.save();

        return res.json({ message: "Order created successfully", orders: savedUserOrders.orders });
    } catch (error) {
        console.error("Error while creating order:", error);
        return res.status(500).json({ message: "Internal server error" });
    }
};


const getOrder = async (req, res) => {
    try {

        // Extract the UID from the request body
        const { uid } = req.params;
        // Connect to the MongoDB database
        const db = mongoose.connection.useDb("NukkadFoods");
        const Order = db.model('Order', orderSchema);

        // Fetch all orders from the "orders" collection
        let userOrders = await Order.findOne({ uid: uid });
        

        // Return the orders as JSON response
        return res.json({ orders : userOrders.orders});
    } catch (error) {
        console.error("Error while fetching orders:", error);
        return res.status(500).json({ message: "Internal server error" });
    } finally {
        
    }
}

const getOrderById = async (uid, orderId) => {
    try {
        // Connect to the MongoDB database
        const db = mongoose.connection.useDb("NukkadFoods");
        const Order = db.model('Order', orderSchema);

        // Find the order by UID and order ID
        const order = await Order.findOne({ uid: uid, "orders.orderId": orderId });

        // Return only the specific order from the orders array
        return order ? order.orders.find(o => o.orderId === orderId) : null;
    } catch (error) {
        console.error("Error while fetching order by ID:", error);
        throw error;
    }
};



// Function to update order by ID
const updateOrderById = async (uid, orderId, updateData) => {
    try {
        // Connect to the MongoDB database
        const db = mongoose.connection.useDb("NukkadFoods");
        const Order = db.model('Order', orderSchema);

        // Find the order by UID and order ID
        const foundOrder = await Order.findOne({ uid: uid, "orders.orderId": orderId });

        // If the order is found, update the specific order within the orders array
        if (foundOrder) {

            for( key in updateData){
                if(updateData.hasOwnProperty(key))
                    {
                        foundOrder.orders.find(o => o.orderId === orderId)[key] = updateData[key];
                    }
            }

                
            // foundOrder.orders.find(o => o.orderId === orderId);
            

            // // Save the updated document
            const savedOrder = await foundOrder.save();

            // // Return the updated order
            return savedOrder.orders.find(o => o.orderId === orderId);
            
        } else {
            return null; // Order not found
        }
    } catch (error) {
        console.error("Error while updating order by ID:", error);
        throw error;
    }
};


const deleteOrderById = async (uid, orderId) => {
    try {
        // Connect to the MongoDB database
        const db = mongoose.connection.useDb("NukkadFoods");
        const Order = db.model('Order', orderSchema);

        // Find the order by UID and order ID
        const foundOrder = await Order.findOne({ uid: uid, "orders.orderId": orderId });

        // If the order is found, remove the specific order from the orders array
        if (foundOrder) {
            // Find the index of the order in the orders array
            const orderIndex = foundOrder.orders.findIndex(o => o.orderId === orderId);

            // If the order is found in the array
            if (orderIndex !== -1) {
                // Remove the order from the orders array
                const deletedOrder = foundOrder.orders.splice(orderIndex, 1)[0];
                const Cancel = db.model("CancelledOrder", orderSchema);
                let CanceluserOrders = await Cancel.findOne({ uid: uid });

                // If the document doesn't exist, create a new one
                if (!CanceluserOrders) {
                    CanceluserOrders = new Cancel({ uid: uid, orders: [] });
                }
            CanceluserOrders.orders.push(deletedOrder);
            await CanceluserOrders.save();
                // Save the updated document
                await foundOrder.save();

                // Return the deleted order
                return { success: true, deletedOrder : deletedOrder};
            } else {
                // If order is not found in the array
                return { success: false, message: "Order not found" };
            }
        } else {
            // If the order is not found
            return { success: false, message: "Order not found" };
        }
    } catch (error) {
        // If there's an error, throw and handle it at the caller level
        console.error("Error while deleting order by ID:", error);
        throw error;
    }
};


const getAllOrders = async (req, res) => {
    try {
        // Connect to the MongoDB database
        const db = mongoose.connection.useDb("NukkadFoods");
        const Order = db.model('Order', orderSchema);

        // Fetch all orders from the "orders" collection
        const allOrders = await Order.find({});

        // Initialize an array to store flattened orders
        const flattenedOrders = [];

        // Iterate over fetched orders and flatten them
        allOrders.forEach(order => {
            const { uid, orders } = order;
            orders.forEach(orderData => {
                const flattenedOrder = { ...orderData.toObject(), uid: uid };
                flattenedOrders.push(flattenedOrder);
            });
        });

        // Return the flattened orders as JSON response
        return res.json({ orders: flattenedOrders });
    } catch (error) {
        console.error("Error while fetching orders:", error);
        return res.status(500).json({ message: "Internal server error", error:error });
    }
}




module.exports = { createOrder , getOrder , getOrderById , updateOrderById , deleteOrderById, getAllOrders};