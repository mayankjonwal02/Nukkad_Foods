const mongoose = require('mongoose');

const subscribeSchema = new mongoose.Schema({
    restaurantId: String,
    amount: Number,
    duration: Number,
});

module.exports = { subscribeSchema };