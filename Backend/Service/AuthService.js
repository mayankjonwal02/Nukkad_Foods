const mongoose = require("mongoose")
const { errorMonitor } = require("ws")

const loginService = async (req, res) => {
    let phonenumber = req.body.phonenumber
    let password = req.body.password

    try {
        let DB = mongoose.connection.useDb("NukkadFoods")
        let collection = DB.collection("users")

        const user = await collection.findOne({phonenumber: phonenumber})

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


const signupService = async (req, res) => {
    let {
        nukkadName,
        nukkadAddress,
        latitude,
        longitude,
        phoneNumber,
        password,
        ownerPhoto,
        ownerEmail,
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
        let DB = mongoose.connection.useDb("NukkadFoods")
        let usersCollection = DB.collection("users")

        const user = await usersCollection.findOne({ phoneNumber: phoneNumber })

        if (!user) {
            await usersCollection.insertOne({
                nukkadName: nukkadName,
                nukkadAddress: nukkadAddress,
                latitude: latitude,
                longitude: longitude,
                phoneNumber: phoneNumber,
                password: password,
                ownerPhoto: ownerPhoto,
                ownerEmail: ownerEmail,
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
            })
            console.log("User Added Successfully")
            return res.json({ message: "User Added Successfully", executed: true })
        } else {
            return res.json({ message: "User Already Exists", executed: false })
        }
    } catch (error) {
        console.log("Error While Adding User :", error)
        return res.json({ message: error, executed: false })
    }
}


module.exports = {loginService,signupService}