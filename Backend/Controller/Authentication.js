const express = require("express")
const router = express.Router()
const mongoose = require("mongoose")
const { errorMonitor } = require("ws")

router.get("/test",(req,res)=> {
    return res.json({message:"Working"})
})


router.post("/signup", async (req,res) => {
    let phonenumber = req.body.phonenumber
    let password = req.body.password

 try {
    let DB = mongoose.connection.useDb("NukkadFoods")
    DB.collection("users").findOne({phonenumber:phonenumber})
    .then((user) => {
       
        if(!user)
        {
            DB.collection("users").insertOne({
                phonenumber : phonenumber,
                password : password
            })
            .then(()=> {
                console.log("User Added Successfully")
                return res.json({message:"User Added Successfully",executed:true})
            })
            .catch((error) => {
                console.log("Error While Adding User :",error)
                return res.json({message:error,executed:false})
            })
        }
        else
        {
            return res.json({message:"UserId Already Exist",executed:false})
        }
    })
    .catch((error) => {
        console.log("Error While Adding User :",error)
        return res.json({message:error,executed:false})
    })
  
   
    
 } catch (error) {
    console.log("Error While Adding User :",error)
    return res.json({message:error,executed:false})
 }


 
})



router.post("/login",async (req,res) => {
    
    let phonenumber = req.body.phonenumber
    let password = req.body.password

    try {
        let DB = mongoose.connection.useDb("NukkadFoods")
        let collection = DB.collection("users")

        collection.findOne({phonenumber: phonenumber})
        .then((user) => {
            if(!user)
            {
                return res.json({message:"User Doesn't Exist",executed:false})
            }

            

            if(password === user.password)
            {
                return res.json({message:"Login Successful",executed:true})
            }
            else
            {
                return res.json({message:"Wrong Password",executed:false})
            }
        })
        .catch((err) => {
            console.log("Error : ",err)
            return res.json({message:err,executed:false})
        })
    } catch (error) {
        console.log("Error : ",error)
        return res.json({message:error,executed:false})
    }

})



module.exports = router