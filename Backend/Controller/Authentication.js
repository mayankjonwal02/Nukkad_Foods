const express = require("express")
const router = express.Router()
const mongoose = require("mongoose")
const { errorMonitor } = require("ws")
const {loginService,signupService,getRestaurantUserService, userSignUp,userLogin,getUserByID,updateUserById} = require("../Service/AuthService")
router.get("/test",(req,res)=> {
    return res.json({message:"Working"})
})


router.post("/signup", signupService)
router.post("/login",loginService)
router.post("/getRestaurantUser/:id",getRestaurantUserService)

router.post("/userSignUp",userSignUp)
router.post("/userLogin",userLogin)
router.post("/getUserByID/:id",getUserByID)
router.post("/updateUserById",updateUserById)



module.exports = router