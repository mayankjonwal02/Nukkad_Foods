const express = require("express")
const router = express.Router()
const mongoose = require("mongoose")
const { errorMonitor } = require("ws")
const {loginService,signupService,getRestaurantUserService, userSignUp,userLogin,getUserByID,updateUserById,fetchAllUsers,fetchAllRestaurants,DeliveryBoyloginService, DeliveryBoysignupService, getDeliveryBoyById, updateDeliveryBoyById, deleteDeliveryBoyById, getAllDeliveryBoys} = require("../Service/AuthService")
router.get("/test",(req,res)=> {
    return res.json({message:"Working"})
})


router.post("/signup", signupService)
router.post("/login",loginService)
router.post("/getRestaurantUser/:id",getRestaurantUserService)
router.get("/fetchAllRestaurants",fetchAllRestaurants)

router.post("/userSignUp",userSignUp)
router.post("/userLogin",userLogin)
router.post("/getUserByID/:id",getUserByID)
router.post("/updateUserById",updateUserById)
router.get("/fetchAllUsers",fetchAllUsers)

router.post("/DeliveryBoysignup", DeliveryBoysignupService)
router.post("/DeliveryBoylogin",DeliveryBoyloginService)
router.get("/getDeliveryBoyById/:id",getDeliveryBoyById)
router.post("/updateDeliveryBoyById",updateDeliveryBoyById)
router.post("/deleteDeliveryBoyById",deleteDeliveryBoyById)
router.get("/getAllDeliveryBoys",getAllDeliveryBoys)




module.exports = router