const { Razorpay } = require('razorpay');

var instance = new Razorpay({
    key_id: 'rzp_test_g3weyLyFbah2vy',
    key_secret: 'LkHQw3JsS1M6w2Vx4zGmC59b',
});


const paymentService = async (req, res) => {
    try {
        const { amount } = req.body;
        var options = {
            amount: amount,  // amount in the smallest currency unit
            currency: "INR",
            receipt: "order_rcptid_11"
        };
        instance.orders.create(options, function (err, order) {
            console.log(order);
            return res.status(200).json({ order });
        });
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
}

