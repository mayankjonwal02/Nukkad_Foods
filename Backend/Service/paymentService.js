const axios = require('axios');
const uniqueid = require('uniqueid');
// testing setup
const Phone_Pay_Host_URL = "https://api-preprod.phonepe.com/apis/pg-sandbox"
const Phone_Pay_Merchant_ID = "PGTESTPAYUAT"
const Merchant_User_ID = 12345
const Salt_Index = 1
const Salt_Key = "099eb0cd-02cf-4e2a-8aca-3e6c6aff0399"

const payload = {
    "merchantId": Phone_Pay_Merchant_ID,
    "merchantTransactionId": uniqueid(),
    "merchantUserId": Merchant_User_ID,
    "amount": 10000, //in paise
    "redirectUrl": "https://webhook.site/redirect-url",
    "redirectMode": "REDIRECT",
    // "callbackUrl": "https://webhook.site/callback-url",
    "mobileNumber": "9999999999",
    "paymentInstrument": {
      "type": "PAY_PAGE"
    }
  }
// const xVerify SHA256(base64 encoded payload + “/pg/v1/pay” +salt key) + ### + salt index
const getPayment = (req, res) => {
    const payEndPoint = "/pg/v1/pay"

    const options = {
        method: 'post',
        url: `${Phone_Pay_Host_URL}${payEndPoint}`,
        headers: {
            accept: 'application/json',
            'Content-Type': 'application/json',
        },
        data: {
        }
    };
    axios
        .request(options)
        .then(function (response) {
            console.log(response.data);
        })
        .catch(function (error) {
            console.error(error);
        });

}


