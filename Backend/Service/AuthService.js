const mongoose = require("mongoose")
const { errorMonitor } = require("ws")
const {userSchema} = require("../Entity/User_Entity")

const loginService = async (req, res) => {
    let phonenumber = req.body.phoneNumber
    let password = req.body.password

    try {
        let DB = mongoose.connection.useDb("NukkadFoods")
        let collection = DB.collection("Restaurants")

        const user = await collection.findOne({phoneNumber: phonenumber})

        if (!user) {
            return res.json({ message: "Restaurant Doesn't Exist", executed: false })
        }

        if (password === user.password) {
            return res.json({ message: "Login Successful", executed: true , uid : user._id})
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
        foodImages
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
                foodImages: foodImages
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
        const user = await collection.findOne({_id: objectId})

        if (!user) {
            return res.json({ message: "Restaurant Doesn't Exist", executed: false })
        }

        return res.json({ message: "Restaurant Found", executed: true, user: user })
    } catch (error) {
        console.log("Error : ", error)
        return res.json({ message: error, executed: false })
    }
}



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

        const user = await User.findOne({contact: contact})

        if (!user) {
            return res.json({ message: "User Doesn't Exist", executed: false })
        }

        if (password === user.password) {
            return res.json({ message: "Login Successful", executed: true , uid : user._id})
        } else {
            return res.json({ message: "Wrong Password", executed: false })
        }
    } catch (error) {
        console.log("Error : ", error)
        return res.json({ message: error, executed: false })
    }
}

const getUserByID = async (req,res) => {
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

const updateUserById = async (req,res) => {
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


module.exports = {loginService,signupService,getRestaurantUserService , userSignUp , userLogin,getUserByID,updateUserById}