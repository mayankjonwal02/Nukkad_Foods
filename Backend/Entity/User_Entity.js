// models/User.js
const mongoose = require('mongoose');

const userSchema = new mongoose.Schema({
    username: {
        type: String,
        required: true
    },
    email: {
        type: String,
        required: true,
        unique: true
    },
    contact: {
        type: String,
        required: true,
        unique: true
    },
    password: {
        type: String,
        required: true
    },
    latitude: {
        type: Number,
        required: true
    },
    longitude: {
        type: Number,
        required: true
    },
    houseFlatNo: {
        type: String,
        required: true
    },
    area: {
        type: String,
        required: true
    },
    colony: {
        type: String
    },
    hint: {
        type: String,
        required: true
    },
    saveAs: {
        type: String,
        required: true
    },
    ordersData: {
        type: Array,
        default: []
    }
});

module.exports = { userSchema };
