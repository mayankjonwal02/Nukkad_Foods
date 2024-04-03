const mongoose = require("mongoose")

const ConnectMongo = async () => {
    
    mongoose.connect(
        "mongodb://localhost:27017"
    )
    .then(() => {
        console.log("------------------------------Connected to MongoDB-------------------------------")
        
    })
    .catch((error) => {
        console.log("Error connecting MongoDB : ",error)
    })

}

module.exports = ConnectMongo