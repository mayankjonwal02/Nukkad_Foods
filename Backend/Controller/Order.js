const express = require('express');
const router = express.Router();
const { createOrder , getOrder, getOrderById,updateOrderById , deleteOrderById,getAllOrders} = require('../Service/OrderService');


router.post('/createOrder', createOrder);
router.get("/orders/:uid", getOrder);

router.get("/orders/:uid/:orderId", async (req, res) => {
    try {
        const uid = req.params.uid;
        const orderId = req.params.orderId;
        
        const order = await getOrderById(uid, orderId);

        if (!order) {
            return res.status(404).json({ message: "Order not found" });
        }

        return res.json({ order });
    } catch (error) {
        console.error("Error while fetching order by ID:", error);
        return res.status(500).json({ message: "Internal server error" });
    }
});

// PUT (update) order by ID
router.put("/orders/:uid/:orderId", async (req, res) => {
    try {
        const uid = req.params.uid;
        const orderId = req.params.orderId;
        const {updateData }= req.body;

        const updatedOrder = await updateOrderById(uid, orderId, updateData);

        if (!updatedOrder) {
            return res.status(404).json({ message: "Order not found" });
        }

        return res.json({ message: "Order updated successfully", order: updatedOrder });
    } catch (error) {
        console.error("Error while updating order by ID:", error);
        return res.status(500).json({ message: "Internal server error" });
    }
});


router.delete("/orders/:uid/:orderId", async (req, res) => {
    try {
        const uid = req.params.uid;
        const orderId = req.params.orderId;

        const {success , deletedOrder} = await deleteOrderById(uid, orderId);

        if (!deletedOrder) {
            return res.status(404).json({ message: "Order not found" });
        }

        return res.json({ message: "Order deleted successfully", order: deletedOrder });
    } catch (error) {
        console.error("Error while deleting order by ID:", error);
        return res.status(500).json({ message: "Internal server error" });
    }
});

router.get("/getAllOrders",getAllOrders);
module.exports = router;