const mongoose = require('mongoose');

const addsSchema = new mongoose.Schema({
    restaurantId: {
        type: String,
        required: true
    },
    amount : {
        type: Number,
        required: true
    },
    startDate: {
        type: Date,
        required: true
    },
    endDate: {
        type: Date,
        required: true
    }
});

let DB = mongoose.connection.useDb("NukkadFoods");
const Adds = DB.model('Adds', addsSchema);

module.exports = {Adds};