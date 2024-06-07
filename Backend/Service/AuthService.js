const mongoose = require("mongoose")
const { errorMonitor } = require("ws")
const { userSchema } = require("../Entity/User_Entity")
const {DeliveryBoy }= require('../Entity/Delivery_boy_Entity');

const loginService = async (req, res) => {
    let phonenumber = req.body.phoneNumber
    let password = req.body.password

    try {
        let DB = mongoose.connection.useDb("NukkadFoods")
        let collection = DB.collection("Restaurants")

        const user = await collection.findOne({ phoneNumber: phonenumber })

        if (!user) {
            return res.json({ message: "Restaurant Doesn't Exist", executed: false })
        }

        if (password === user.password) {
            return res.json({ message: "Login Successful", executed: true, uid: user._id })
        } else {
            return res.json({ message: "Wrong Password", executed: false })
        }
    } catch (error) {
        console.log("Error : ", error)
        return res.json({ message: error, executed: false })
    }
}


const signupService = async (req, res) => {
    let {
        nukkadName,
        nukkadAddress,
        latitude,
        longitude,
        pincode,
        city,
        landmark,
        phoneNumber,
        password,
        ownerPhoto,
        ownerEmail,
        ownerName,
        ownerContactNumber,
        currentAddress,
        permananetAddress,
        referred,
        signature,
        bankAccountNo,
        bankIFSCcode,
        bankBranch,
        fssaiCertificateNumber,
        fssaiExpiryDate,
        fssaiCertificateUrl,
        gstNumber,
        gstCertificateUrl,
        kycAadharNumber,
        kycPanNumber,
        cuisines,
        operationalHours,
        restaurantMenuImages,
        restaurantImages,
        foodImages,
        status
    } = req.body;

    try {
        let DB = mongoose.connection.useDb("NukkadFoods");
        let usersCollection = DB.collection("Restaurants");

        const user = await usersCollection.findOne({ phoneNumber: phoneNumber });

        if (!user) {
            await usersCollection.insertOne({
                nukkadName: nukkadName,
                nukkadAddress: nukkadAddress,
                latitude: latitude,
                longitude: longitude,
                pincode: pincode,
                city: city,
                landmark: landmark,
                phoneNumber: phoneNumber,
                password: password,
                ownerPhoto: ownerPhoto,
                ownerEmail: ownerEmail,
                ownerName: ownerName,
                ownerContactNumber: ownerContactNumber,
                currentAddress: currentAddress,
                permananetAddress: permananetAddress,
                referred: referred,
                signature: signature,
                bankDetails: {
                    accountNo: bankAccountNo,
                    IFSCcode: bankIFSCcode,
                    bankBranch: bankBranch
                },
                fssaiDetails: {
                    certificateNumber: fssaiCertificateNumber,
                    expiryDate: fssaiExpiryDate,
                    certificateUrl: fssaiCertificateUrl
                },
                gstDetails: {
                    gstNumber: gstNumber,
                    gstCertificateUrl: gstCertificateUrl
                },
                kycDetails: {
                    aadharNumber: kycAadharNumber,
                    panNumber: kycPanNumber
                },
                cuisines: cuisines,
                operationalHours: operationalHours,
                restaurantMenuImages: restaurantMenuImages,
                restaurantImages: restaurantImages,
                foodImages: foodImages,
                status: "unverified"
            });
            console.log("Restaurant Added Successfully");
            return res.json({ message: "Restaurant Added Successfully", executed: true });
        } else {
            return res.json({ message: "Restaurant Already Exists", executed: false });
        }
    } catch (error) {
        console.log("Error While Adding Restaurant :", error);
        return res.json({ message: error, executed: false });
    }
};


const getRestaurantUserService = async (req, res) => {
    let id = req.params.id;


    try {
        let DB = mongoose.connection.useDb("NukkadFoods")
        let collection = DB.collection("Restaurants")
        const objectId = new mongoose.Types.ObjectId(id);
        const user = await collection.findOne({ _id: objectId })

        if (!user) {
            return res.json({ message: "Restaurant Doesn't Exist", executed: false })
        }

        return res.json({ message: "Restaurant Found", executed: true, user: user })
    } catch (error) {
        console.log("Error : ", error)
        return res.json({ message: error, executed: false })
    }
}


const fetchAllRestaurants = async (req, res) => {
    try {
        let DB = mongoose.connection.useDb("NukkadFoods");
        let collection = DB.collection("Restaurants");

        const restaurants = await collection.find({}, { projection: { password: 0 } }).toArray();

        if (!restaurants || restaurants.length === 0) {
            return res.json({ message: "No Restaurants Found", executed: false });
        }

        return res.json({ message: "Restaurants Found", executed: true, restaurants: restaurants });
    } catch (error) {
        console.log("Error : ", error);
        return res.json({ message: error, executed: false });
    }
}


const updateRestaurantById = async (req, res) => {
    const { _id, updateData } = req.body;
    try {
        let DB = mongoose.connection.useDb("NukkadFoods");
        let Restaurant = DB.collection("Restaurants");

        // Find the restaurant by its _id
        const id = new mongoose.Types.ObjectId(_id);
        const restaurant = await Restaurant.findOne({ _id: id });

        if (!restaurant) {
            return res.json({ message: "Restaurant Doesn't Exist", executed: false });
        }

        // Update the restaurant's data
        await Restaurant.updateOne({ _id: id }, { $set: updateData });

        return res.json({ message: "Restaurant Updated Successfully", executed: true });
    } catch (error) {
        console.log("Error:", error);
        return res.json({ message: error.toString(), executed: false });
    }
};




const userSignUp = async (req, res) => {
    let {
        username,
        email,
        contact,
        password,
        latitude,
        longitude,
        houseFlatNo,
        area,
        gender,
        userImage,
        colony,
        hint,
        saveAs
    } = req.body;

    try {
        const db = mongoose.connection.useDb("NukkadFoods");
        const User = db.model('User', userSchema);
        const user = await User.findOne({
            $or: [{ email: email }, { contact: contact }]
        });

        if (!user) {
            const newUser = new User({
                username,
                email,
                contact,
                password,
                latitude,
                longitude,
                houseFlatNo,
                area,
                colony,
                hint,
                gender,
                userImage,
                saveAs,
                ordersData: [] // Ensure ordersData is initialized as an empty list
            });

            await newUser.save();
            console.log("User Added Successfully");
            return res.json({ message: "User Added Successfully", executed: true });
        } else {
            return res.json({ message: "User Already Exists", executed: false });
        }
    } catch (error) {
        console.log("Error While Adding User:", error);
        return res.json({ message: error.message, executed: false });
    }
};
const userLogin = async (req, res) => {
    let contact = req.body.contact
    let password = req.body.password

    try {
        let DB = mongoose.connection.useDb("NukkadFoods")
        let User = DB.model('User', userSchema);

        const user = await User.findOne({ contact: contact })

        if (!user) {
            return res.json({ message: "User Doesn't Exist", executed: false })
        }

        if (password === user.password) {
            return res.json({ message: "Login Successful", executed: true, uid: user._id })
        } else {
            return res.json({ message: "Wrong Password", executed: false })
        }
    } catch (error) {
        console.log("Error : ", error)
        return res.json({ message: error, executed: false })
    }
}

const getUserByID = async (req, res) => {
    let id = req.params.id;
    try {
        let DB = mongoose.connection.useDb("NukkadFoods")
        let User = DB.model('User', userSchema);
        const user = await User.findById(id).select("-password")

        if (!user) {
            return res.json({ message: "User Doesn't Exist", executed: false })
        }

        return res.json({ message: "User Found", executed: true, user: user })
    } catch (error) {
        console.log("Error : ", error)
        return res.json({ message: error, executed: false })
    }
}

const updateUserById = async (req, res) => {
    const { _id, updateData } = req.body;
    try {
        let DB = mongoose.connection.useDb("NukkadFoods")
        let User = DB.model('User', userSchema);
        const user = await User.findById(_id)

        if (!user) {
            return res.json({ message: "User Doesn't Exist", executed: false })
        }

        Object.keys(updateData).forEach(key => {
            user[key] = updateData[key];
        });

        await user.save();
        return res.json({ message: "User Updated Successfully", executed: true });
    } catch (error) {
        console.log("Error : ", error)
        return res.json({ message: error, executed: false })
    }

}


const fetchAllUsers = async (req, res) => {
    try {
        let DB = mongoose.connection.useDb("NukkadFoods");
        let User = DB.model('User', userSchema);

        // Fetching all users while neglecting the password field
        const users = await User.find({}, { password: 0 });

        return res.json({ message: "Users retrieved successfully", users: users });
    } catch (error) {
        console.log("Error : ", error);
        return res.json({ message: error, users: [] });
    }
}


const DeliveryBoyloginService = async (req, res) => {
    const { contact, password } = req.body;
    try {
        // Find the delivery boy by phone number
        let DB = mongoose.connection.useDb("NukkadFoods");
        let delivery = DB.model('DeliveryBoy', DeliveryBoy);

        const deliveryBoy = await delivery.findOne({ contact: contact});

        // If delivery boy not found
        if (!deliveryBoy) {
            return res.status(404).json({ message: "Delivery boy not found", executed: false });
        }

        // Check if password matches
        if (password === deliveryBoy.password) {
            return res.json({ message: "Login Successful", executed: true, uid: deliveryBoy._id });
        } else {
            return res.status(401).json({ message: "Wrong Password", executed: false });
        }
    } catch (error) {
        console.error("Error:", error);
        return res.status(500).json({ message: error.message, executed: false });
    }
};

const DeliveryBoysignupService = async (req, res) => {
    const deliveryBoyData = req.body;
    try {
        // Check if delivery boy already exists
        let DB = mongoose.connection.useDb("NukkadFoods");
        let delivery = DB.model('DeliveryBoy', DeliveryBoy);

        const existingDeliveryBoy = await delivery.findOne({ contact: deliveryBoyData.contact });
        if (existingDeliveryBoy) {
            return res.status(400).json({ message: "Delivery boy already exists", executed: false });
        }

        // Create a new delivery boy
        const newDeliveryBoy = new delivery(deliveryBoyData);
        await newDeliveryBoy.save();
        return res.json({ message: "Delivery boy added successfully", executed: true });
    } catch (error) {
        console.error("Error:", error);
        return res.status(500).json({ message: error.message, executed: false });
    }
};

const getDeliveryBoyById = async (req, res) => {
    const { id } = req.params;
    try {
        let DB = mongoose.connection.useDb("NukkadFoods");
        let delivery = DB.model('DeliveryBoy', DeliveryBoy);

        const deliveryBoy = await delivery.findById(id);
        if (!deliveryBoy) {
            return res.status(404).json({ message: "Delivery boy not found", executed: false });
        }
        return res.json({ message: "Delivery boy found", executed: true, deliveryBoy });
    } catch (error) {
        console.error("Error:", error);
        return res.status(500).json({ message: error.message, executed: false });
    }
};

const updateDeliveryBoyById = async (req, res) => {
    const { id,  updateData  } = req.body;
   
    try {
        let DB = mongoose.connection.useDb("NukkadFoods");
        let delivery = DB.model('DeliveryBoy', DeliveryBoy);

        const deliveryBoy = await delivery.findById(id);
   
        if (!deliveryBoy) {
            return res.status(404).json({ message: "Delivery boy not found", executed: false });
        }

        for (let key in updateData) {
            
            deliveryBoy[key] = updateData[key];
        }
        // return res.json(deliveryBoy);
        await deliveryBoy.save();

        return res.json({ message: "Delivery boy updated successfully", executed: true, deliveryBoy});
    } catch (error) {
        console.error("Error:", error);
        return res.status(500).json({ message: error.message, executed: false });
    }
};


const deleteDeliveryBoyById = async (req, res) => {
    const { id } = req.params;
    try {
        let DB = mongoose.connection.useDb("NukkadFoods");
        let delivery = DB.model('DeliveryBoy', DeliveryBoy);

        const deliveryBoy = await delivery.findByIdAndDelete(id);
        if (!deliveryBoy) {
            return res.status(404).json({ message: "Delivery boy not found", executed: false });
        }
        return res.json({ message: "Delivery boy deleted successfully", executed: true });
    } catch (error) {
        console.error("Error:", error);
        return res.status(500).json({ message: error.message, executed: false });
    }
};

const getAllDeliveryBoys = async (req, res) => {
    try {
        let DB = mongoose.connection.useDb("NukkadFoods");
        let delivery = DB.model('DeliveryBoy', DeliveryBoy);

        const deliveryBoys = await delivery.find({});
        return res.json({ message: "Delivery boys retrieved successfully", deliveryBoys });
    } catch (error) {
        console.error("Error:", error);
        return res.status(500).json({ message: error.message });
    }
};






module.exports = { loginService, signupService, getRestaurantUserService, updateRestaurantById,userSignUp, userLogin, getUserByID, updateUserById, fetchAllUsers,fetchAllRestaurants,
     DeliveryBoyloginService, DeliveryBoysignupService, getDeliveryBoyById, updateDeliveryBoyById, deleteDeliveryBoyById, getAllDeliveryBoys}