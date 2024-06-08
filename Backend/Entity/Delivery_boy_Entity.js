const mongoose = require('mongoose');

const deliveryBoySchema = new mongoose.Schema({
    name: {
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
    city: {
        type: String,
        required: true
    },
    isReferred: {
        type: Boolean,
        default: false
    },
    firstName: String,
    middleName: String,
    lastName: String,
    gender: String,
    DOB: Date,
    whatsappContact: String,
    alternateNumber: String,
    bankDetails: {
        IFSCCode: String,
        branchCode: String,
        accountNumber: String
    },
    idProofPic: Buffer,
    pancardPic: Buffer,
    drivingLicensePic: Buffer,
    workPreference: [{
        locationName: String,
        description: String
    }],
    workTimings: [String]
});

DeliveryBoy = deliveryBoySchema;

module.exports ={ DeliveryBoy};
