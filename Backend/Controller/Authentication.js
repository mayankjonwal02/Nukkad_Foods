const express = require("express")
const router = express.Router()
const mongoose = require("mongoose")
const { errorMonitor } = require("ws")
const {loginService,signupService} = require("../Service/AuthService")
router.get("/test",(req,res)=> {
    return res.json({message:"Working"})
})


router.post("/signup", signupService)



router.post("/login",loginService)



module.exports = router