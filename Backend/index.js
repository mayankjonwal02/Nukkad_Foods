const express = require('express');
const cors = require('cors');
const path = require('path');
const ConnectMongo = require('./DatabaseConnection/mongoDB');
const authRouter = require('./Controller/Authentication');
const orderRouter = require('./Controller/Order');
const menuRouter = require('./Controller/Menu');
const smsRouter = require('./Controller/SMS');
const subscribeRouter = require('./Controller/Subscribe');
const AddRouter = require('./Controller/Adds');


const port = 3000;
const app = express();

app.use(cors());
app.use(express.json());

// Remove view engine setup as it's not needed for serving static HTML files
// app.set('view engine', 'ejs');
// app.set('views', path.join(__dirname, 'views'));

app.use('/api/auth', authRouter);
app.use('/api/order', orderRouter);
app.use('/api/menu', menuRouter);
app.use('/api/sms', smsRouter);
app.use('/api/subscribe', subscribeRouter);
app.use('/api/adds', AddRouter);


app.get('/', (req, res) => {
  res.send('Hello World!');
});

// Serve the static HTML file
app.get('/ui', (req, res) => {
  res.sendFile(path.join(__dirname, '/views/index.html'));
});

app.get('/test', (req, res) => {
  res.send('Running');
});

app.listen(port, '0.0.0.0', () => {
  console.log(`Example app listening on port ${port}`);
});

ConnectMongo();
