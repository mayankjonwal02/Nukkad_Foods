const express = require('express')
const cors = require("cors")
const ConnectMongo = require("./DatabaseConnection/mongoDB")
const authRouter = require("./Controller/Authentication")
const orderRouter = require("./Controller/Order")
const menuRouter = require("./Controller/Menu")



const port = 3000
const app = express()
app.use(cors());
app.use(express.json())


app.use("/api/auth",authRouter)
app.use("/api/order",orderRouter)
app.use("/api/menu",menuRouter)


app.get('/', (req, res) => {
  res.send('Hello World!')
})

app.get("/test" ,(req,res) => {
    res.send("Running")
})

app.listen(port, '0.0.0.0' ,() => {
  console.log(`Example app listening on port ${port}`)
})


ConnectMongo()