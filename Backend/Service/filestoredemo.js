const multer = require('multer');
const path = require('path');
const fs = require('fs');


const storage = multer.diskStorage({
    destination: function (req, file, cb) {
        const uploadDir = 'uploads/';
        // Ensure the uploads directory exists
        if (!fs.existsSync(uploadDir)) {
            fs.mkdirSync(uploadDir, { recursive: true });
        }
        cb(null, uploadDir);
    },
    filename: function (req, file, cb) {
        const uniqueSuffix = Date.now() + '-' + Math.round(Math.random() * 1E9);
        cb(null, uniqueSuffix + '-' + file.originalname);
    }
});

const upload = multer({ storage: storage });


function setMyUpload(req, res) {
    upload.fields([{ name: 'image', maxCount: 1 }, { name: 'aadhar', maxCount: 1 }])(req, res, function(err) {
        if (err instanceof multer.MulterError) {
            return res.status(500).json({ error: err.message });
        } else if (err) {
            return res.status(500).json({ error: err.message });
        }

      

        const {name , userclass} = req.body;
        const userClass = userclass;
        const imageFile = req.files['image'] ? req.files['image'][0] : null;
        const aadharFile = req.files['aadhar'] ? req.files['aadhar'][0] : null;

        if (!name || !userClass) {
            return res.status(400).json({ error: 'Name and class are required' });
        }

        if (!imageFile || !aadharFile) {
            return res.status(400).json({ error: 'Image and Aadhar file are required' });
        }

        res.json({
            message: 'Files and data received successfully',
            data: {
                name: name,
                class: userClass,
                image: imageFile.filename,
                aadhar: aadharFile.filename
            }
        });
    });
}


module.exports = { setMyUpload };