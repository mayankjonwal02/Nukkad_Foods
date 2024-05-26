const mongoose = require('mongoose');

const complaintSchema = new mongoose.Schema({
    status: { type: String, required: true },
    orderID: { type: String, required: true },
    description: { type: String, required: true },
    complaintByID: { type: String, required: true },
    designation: { type: String, required: true }
}, { timestamps: true });

const restaurantComplaintSchema = new mongoose.Schema({
    restaurantID: { type: String, required: true },
    complaints: [complaintSchema]
});

const db = mongoose.connection.useDb('NukkadFoods');


const complaintDB = db.model('Complaints', restaurantComplaintSchema);

module.exports = {complaintDB,restaurantComplaintSchema};
