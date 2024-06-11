const fs = require('fs');
const mongoose = require('mongoose');
const multer = require('multer');

// Define a Mongoose schema for your user data
const userSchema = new mongoose.Schema({
    name: String,
    class: String,
    image: { data: Buffer, contentType: String }, // Store image data and content type separately
    aadhar: { data: Buffer, contentType: String }, // Store Aadhar data and content type separately
});

// Create a Mongoose model using the schema
const User = mongoose.model('User', userSchema);

// Multer storage configuration to store files in memory
const storage = multer.memoryStorage();
const upload = multer({ storage: storage });

// Function to handle file uploads
const uploadUserData = async (req, res) => {
    try {
      const { name, userclass, imageBytes, imageType, aadharBytes, aadharType } = req.body;
      const userClass = userclass;
  
      // Check if the name and class are provided
      if (!name || !userClass) {
        return res.status(400).json({ error: 'Name and class are required' });
      }
  
      // Check if the image and Aadhar files are provided
      if (!imageBytes || !aadharBytes || !imageType || !aadharType) {
        return res.status(400).json({ error: 'Image and Aadhar file are required' });
      }
  
      // Create a new user document with the provided data
      const user = new User({
        name: name,
        class: userClass,
        image: { data: Buffer.from(imageBytes), contentType: imageType },
        aadhar: { data: Buffer.from(aadharBytes), contentType: aadharType },
      });
  
      // Save the user document to the database
      const savedUser = await user.save();
  
      // Send a success response with the saved user data
      res.json({
        message: 'User data saved successfully',
        data: savedUser,
      });
    } catch (error) {
      console.error('Error uploading user data:', error);
      res.status(500).json({ error: 'Internal Server Error' });
    }
  };


// // Function to handle file uploads
// const uploadUserData = (req, res) => {
//     // Use the upload middleware to handle the file uploads
//     upload.fields([{ name: 'image', maxCount: 1 }, { name: 'aadhar', maxCount: 1 }])(req, res, async function(err) {
//         if (err instanceof multer.MulterError) {
//             return res.status(500).json({ error: err.message });
//         } else if (err) {
//             return res.status(500).json({ error: err.message });
//         }

//         // Extract the name and class from the request body
//         const { name, userclass } = req.body;
//         const userClass = userclass;
//         const imageFile = req.files['image'] ? req.files['image'][0] : null;
//         const aadharFile = req.files['aadhar'] ? req.files['aadhar'][0] : null;

//         // Check if the name and class are provided
//         if (!name || !userClass) {
//             return res.status(400).json({ error: 'Name and class are required' });
//         }

//         // Check if the image and Aadhar files are provided
//         if (!imageFile || !aadharFile) {
//             return res.status(400).json({ error: 'Image and Aadhar file are required' });
//         }

//         // Create a new user document with the provided data
//         const user = new User({
//             name: name,
//             class: userClass,
//             image: { data: imageFile.buffer, contentType: imageFile.mimetype },
//             aadhar: { data: aadharFile.buffer, contentType: aadharFile.mimetype },
//         });

//         // Save the user document to the database
//         const savedUser = await user.save();

//         // Send a success response with the saved user data
//         res.json({
//             message: 'User data saved successfully',
//             data: savedUser,
//         });
//     }

//     );
// }

const getImageByName = async (req, res) => {
    try {
        // Extract the name from the query parameters
        const { name } = req.params;

        // Find the user document with the specified name
        const user = await User.findOne({ name });

        // If the user is not found, send a 404 response
        if (!user) {
            return res.status(404).json({ error: 'User not found' });
        }

        // Send the image data as a response
        res.set('Content-Type', user.image.contentType);
        res.send(user.image.data);
    } catch (error) {
        // If there's an error, send an error response
        console.error('Error fetching image:', error);
        res.status(500).json({ error: error.message });
    }
}


module.exports = { uploadUserData , getImageByName};