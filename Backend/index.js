const express = require('express')
const cors = require("cors")
const ConnectMongo = require("./DatabaseConnection/mongoDB")
const authRouter = require("./Controller/Authentication")


const port = 3000
const app = express()
app.use(cors());
app.use(express.json())


app.use("/auth",authRouter)



app.get('/', (req, res) => {
  res.send('Hello World!')
})

app.get("/test" ,(req,res) => {
    res.send("Running")
})

app.listen(port, () => {
  console.log(`Example app listening on port ${port}`)
})


ConnectMongo()