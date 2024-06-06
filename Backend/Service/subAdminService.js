const mongoose = require('mongoose');
const { subAdminSchema } = require('../Entity/SubAdminSchema');




const createSubAdmin = async (req, res) => {
    try {
        // Extracting data from req body
        const { managerId, UniqueId, password, options } = req.body;
        const db = mongoose.connection.useDb("NukkadFoods");
        const SubAdmin = db.model('SubAdmin', subAdminSchema);

        const existingSubAdmin = await SubAdmin.findOne({ UniqueId: UniqueId });
        if (existingSubAdmin) {
            return res.status(400).json({ message: "SubAdmin with the same UniqueId already exists" });
        }

        // Creating a new document using the subAdminSchema
        const subAdmin = new SubAdmin({
            managerId,
            UniqueId,
            password,
            options
        });

        // Saving the document to the database
        const savedSubAdmin = await subAdmin.save();

        // Sending back the saved document as response
        res.json({savedSubAdmin: savedSubAdmin, message: "SubAdmin created successfully",executed: true});
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