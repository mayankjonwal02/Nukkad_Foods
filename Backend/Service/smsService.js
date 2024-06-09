const twilio = require('twilio');
require('dotenv').config();

const sendSMS = (req, res) => {
    const  accountSid   = process.env.ACCOUNT_SID
    const  authToken    = process.env.AUTH_TOKEN
    const twilioNumber = process.env.TWILIO_NUMBER
    const  client       = new twilio(accountSid, authToken);
    const { to, body } = req.body;
    client.messages
        .create({
            body: body,
            from: twilioNumber,
            to: to
        })
        .then(message => {
            res.status(200).json({ message: 'SMS sent successfully' , Responce : message, executed : true});
        })
        .catch(error => {
            res.status(500).json({ error: error , executed : false});
        });
}

module.exports = { sendSMS }