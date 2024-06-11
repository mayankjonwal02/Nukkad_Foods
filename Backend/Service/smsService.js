const twilio = require('twilio');
require('dotenv').config();

const  accountSid   = process.env.ACCOUNT_SID
const  authToken    = process.env.AUTH_TOKEN
const twilioNumber = process.env.TWILIO_NUMBER
const verifyServiceSid = process.env.VERIFY_SERVICE_SID;
const  client       = require('twilio')(accountSid, authToken);


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

const sendOtp = async (req, res) => {

    const { phoneNumber } = req.body;
    try {
      const verification = await client.verify.services(verifyServiceSid)
        .verifications
        .create({ to: phoneNumber, channel: 'sms' });
      res.status(200).json({ message: 'OTP sent successfully', verification });
    } catch (error) {
      res.status(500).json({ error: error.message });
    }
  };
  
  const verifyOtp = async (req, res) => {
    const { phoneNumber, code } = req.body;
    try {
      const verificationCheck = await client.verify.services(verifyServiceSid)
        .verificationChecks
        .create({ to: phoneNumber, code });
      if (verificationCheck.status === 'approved') {
        res.status(200).json({ message: 'OTP verified successfully' });
      } else {
        res.status(400).json({ message: 'OTP verification failed' });
      }
    } catch (error) {
      res.status(500).json({ error: error.message });
    }
  };
  
  module.exports = { sendSMS, sendOtp, verifyOtp };