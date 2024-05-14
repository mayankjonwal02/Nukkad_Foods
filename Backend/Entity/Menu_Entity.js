const mongoose = require('mongoose');

const menuItemSchema = new mongoose.Schema({
    uid: String,
    menuitemlist: [{
        menuitemName: String,
        menuitemImageURL: String,
        servingInfo: String,
        menuitemCost: Number,
        inStock: Boolean,
        timeToPrepare: Number
    }]
});




module.exports = { menuItemSchema };