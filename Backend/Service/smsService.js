const twilio = require('twilio');
require('dotenv').config();
const  accountSid   = process.env.ACCOUNT_SID
const  authToken    = process.env.AUTH_TOKEN
const twilioNumber = process.env.TWILIO_NUMBER
const  client       = new twilio(accountSid, authToken);

const sendSMS = (req, res) => {
    const { to, body } = req.body;
    client.messages
        .create({
            body: body,
            from: twilioNumber,
            to: to
        })
        .then(message => {
            res.status(200).json({ message: 'SMS sent successfully' , Responce : message});
        })
        .catch(error => {
            res.status(500).json({ error: error.message });
        });
}

module.exports = { sendSMS }