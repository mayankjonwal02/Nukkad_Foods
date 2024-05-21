const express = require("express")
const router = express.Router()


const {sendSMS} = require("../Service/smsService")

router.post("/sendSMS",

sendSMS
// (req,res) => {
//     res.json({message : "SMS sent successfully"})
// }


)

module.exports = router
