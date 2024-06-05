const mongoose = require('mongoose');

const subAdminSchema = new mongoose.Schema({
    managerId: {
        type: String,
        required: true
    },
    UniqueId: {
        type: String,
        required: true,
        unique: true
    },
    password: {
        type: String,
        required: true
    },
    options : [
        {
            type : String,
            required : true
        }
    ]
});


module.exports = { subAdminSchema };