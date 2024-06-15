const mongoose = require('mongoose');

const menuItemSchema = new mongoose.Schema({
    uid: String,
    menuItemList: [{
        category: String,
        subCategory: [{
            subCategoryName: String,
            menuItems: [{
                menuItemName: String,
                menuItemImageURL: String,
                servingInfo: String,
                menuItemCost: Number,
                inStock: Boolean,
                label:String,
                timeToPrepare: Number
            }]
        }]
    }]
});




module.exports = { menuItemSchema };