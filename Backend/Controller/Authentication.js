const express = require("express")
const router = express.Router()
const mongoose = require("mongoose")
const { errorMonitor } = require("ws")
const {loginService,signupService,getUserService} = require("../Service/AuthService")
router.get("/test",(req,res)=> {
    return res.json({message:"Working"})
})


router.post("/signup", signupService)
router.post("/login",loginService)
router.post("/getUser/:id",getUserService)



module.exports = router