const mongoose = require('mongoose');
const { subscribeSchema } = require("../Entity/Subscribe_Entity")

const subscribe = async (req, res) => {
    try {
        const { restaurantId, amount, duration } = req.body;

        let DB = mongoose.connection.useDb("NukkadFoods");
        const Subscribe = DB.model('Subscribe', subscribeSchema);
        let existingSubscription = await Subscribe.findOne({ restaurantId });

        if (!existingSubscription) {
            existingSubscription = new Subscribe({ restaurantId, amount, duration });
        }

        await existingSubscription.save();

        res.status(201).json({ message: 'Subscription added successfully' });
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
}


const getSubscription = async (req, res) => {
    try {
        const { restaurantId } = req.params;

        let DB = mongoose.connection.useDb("NukkadFoods");
        const Subscribe = DB.model('Subscribe', subscribeSchema);
        let existingSubscription = await Subscribe.findOne({ restaurantId });

        if (!existingSubscription) {
            return res.status(404).json({ message: 'Subscription not found' });
        }

        res.status(200).json(existingSubscription);
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
}

const updateSubscription = async (req, res) => {
    try {
        const { restaurantId, amount, duration } = req.body;

        let DB = mongoose.connection.useDb("NukkadFoods");
        const Subscribe = DB.model('Subscribe', subscribeSchema);
        let existingSubscription = await Subscribe.findOne({ restaurantId });

        if (!existingSubscription) {
            return res.status(404).json({ message: 'Subscription not found' });
        }

        existingSubscription.amount = amount;
        existingSubscription.duration = duration;

        await existingSubscription.save();

        res.status(200).json({ message: 'Subscription updated successfully' });
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
}

module.exports = { subscribe, getSubscription, updateSubscription };