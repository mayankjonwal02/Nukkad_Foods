
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


const createPayout = (req, res) => {
    const { amount, currency,  notes, fund_account_id, mode, purpose } = req.body;

    try {
        const options = {
            account_number: process.env.ACCOUNT_NUMBER, // Ensure this environment variable is set
            fund_account_id: fund_account_id,
            amount: amount * 100, // Razorpay expects amount in smallest currency unit
            currency: currency,
            mode: mode,
            purpose: purpose,
            queue_if_low_balance: true,
            notes: notes
        };

        instance.payouts.create(options, (err, payout) => {
            if (err) {
                return res.status(500).json({ error: err, executed: false });
            }
            return res.status(200).json({ payout: payout, status: 200, message: "Payout created successfully", executed: true });
        });
    } catch (error) {
        return res.status(500).json({ error: error.message, executed: false });
    }
};

         


module.exports = { createOrder , verifyPayment , createPayout };
