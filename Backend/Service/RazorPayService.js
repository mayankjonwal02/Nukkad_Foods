
const  Razorpay  = require('razorpay');
const crypto = require('crypto');
var instance = new Razorpay({
    key_id: process.env.Razorpay_KEY_ID,
    key_secret: process.env.Razorpay_KEY_SECRET,
});


const createOrder = async (req, res) => {

    const { amount, currency } = req.body;
    try {
        
        var options = {
            amount: amount ,  // amount in the smallest currency unit
            currency: currency,
            receipt: 'order_'+Date.now(),
            payment_capture: 1
        };

        const order = await instance.orders.create(options)

        return res.status(200).json({ order: order, status: 200 , message: "Order created successfully",executed: true });

    } catch (error) {
        
        return res.status(500).json({ error: error.message,executed: false });
        
    }
   
};


const verifyPayment = async (req, res) => {

    const { razorpay_order_id, razorpay_payment_id, razorpay_signature } = req.body;

    try {

        var body = razorpay_order_id + "|" + razorpay_payment_id;

        var expectedSignature = crypto
            .createHmac('sha256',process.env.Razorpay_KEY_SECRET)
            .update(body.toString())
            .digest('hex');

        if (razorpay_signature === expectedSignature) {
            return res.status(200).json({ status: 200, message: "Payment verified successfully", executed: true });
        }
        else {
            return res.status(400).json({ status: 400, message: "Payment verification failed", executed: false });
        }
    } catch (error) {
        return res.status(500).json({ error: error.message, executed: false });
    }
};
         


module.exports = { createOrder , verifyPayment };
