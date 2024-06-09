const mongoose = require('mongoose');
const { subAdminSchema } = require('../Entity/SubAdminSchema');
require('dotenv').config();



const createSubAdmin = async (req, res) => {
    try {
        // Extracting data from req body
        const { managerId, UniqueId, password, contact , department, options } = req.body;
        const db = mongoose.connection.useDb("NukkadFoods");
        const SubAdmin = db.model('SubAdmin', subAdminSchema);
        let executed = false

        const existingSubAdmin = await SubAdmin.findOne({ UniqueId: UniqueId });
        if (existingSubAdmin) {
            return res.status(400).json({ message: "SubAdmin with the same UniqueId already exists" });
        }

        // Creating a new document using the subAdminSchema
        const subAdmin = new SubAdmin({
            managerId,
            UniqueId,
            password,
            contact,
            department,
            options
        });

        // Saving the document to the database
        const savedSubAdmin = await subAdmin.save();
        const fetch = await import('node-fetch');

        await fetch.default(`${process.env.API_URL}/api/sms/sendSMS`, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({
                to : contact,
                body : `Welcome to Nukkad Foods. Your UniqueId is  ${ UniqueId} +  and Password is  ${ password}. your department is ${ department}  Please do not share your credentials with anyone.`
            })
        })
        .then(response => response.json())
        .then(data => {
            console.log(data);
            executed = data.executed
        })
        .catch(error => {
            console.error(error);
            executed = false
        });

        // Sending back the saved document as response
        res.json({savedSubAdmin: savedSubAdmin, message: "SubAdmin created successfully",executed: executed});
    } catch (error) {
        // If there's an error, send an error response
        res.status(400).json({ message: error.message });
    }
}


const getSubAdmin = async (req, res) => {
    try {
        // Extract managerId from the query parameters
        const { managerId } = req.body;


        const db = mongoose.connection.useDb("NukkadFoods");
        const SubAdmin = db.model('SubAdmin', subAdminSchema);


        // Fetch all sub-admin documents with the specified managerId
        const subAdmins = await SubAdmin.find({ managerId }).select("-password");
        
        res.json(subAdmins); // Send the fetched documents as response
    } catch (error) {
        res.status(500).json({ message: error.message }); // If there's an error, send an error response
    }
}


const SubAdminLogin = async (req, res) => {
    try {
        // Extracting data from req body
        const { UniqueId, password } = req.body;
        const db = mongoose.connection.useDb("NukkadFoods");
        const SubAdminSchema = db.model('SubAdmin', subAdminSchema);

        // Find the document with the given UniqueId
        const subAdmin = await SubAdminSchema.findOne({ UniqueId });
console.log(subAdmin);
        // If the document doesn't exist, send an error response
        if (!subAdmin) {
            return res.status(400).json({ message: "SubAdmin not found" });
        }

        // If the password doesn't match, send an error response
        if (subAdmin.password !== password) {
            return res.status(400).json({ message: "Invalid password" });
        }

        // Send the document as response
        res.json({subAdmin: subAdmin, message: "Login successful",executed: true});
    } catch (error) {
        // If there's an error, send an error response
        res.status(400).json({ message: error.message });
    }
}




module.exports = { createSubAdmin , getSubAdmin , SubAdminLogin};