const mongoose = require("mongoose")

const ConnectMongo = async () => {
    
    mongoose.connect(
        // "mongodb://localhost:27017"
        "mongodb+srv://mayankjonwal02:mayankjonwal02@nukkadfoods.yd5ieat.mongodb.net/?retryWrites=true&w=majority&appName=NukkadFoods"
    )
    .then(() => {
        console.log("------------------------------Connected to MongoDB-------------------------------")
        
    })
    .catch((error) => {
        console.log("Error connecting MongoDB : ",error)
    })

}

module.exports = ConnectMongo