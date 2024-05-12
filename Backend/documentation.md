## NukkadFoods API Documentation

This document outlines the functionalities provided by the NukkadFoods API, enabling developers to integrate NukkadFoods services into their applications. The API utilizes Node.js, Express, Mongoose, and MongoDB for a robust backend structure.

### Authentication APIs

**1. Signup**

* **Endpoint:** `/api/auth/signup` (POST)
* **Request Body:**
   ```json
   {
       "nukkadName": "String", (Required) Name of the nukkad
       "nukkadAddress": "String", (Required) Address of the nukkad
       "latitude": "Number", (Required) Geographical latitude
       "longitude": "Number", (Required) Geographical longitude
       "phoneNumber": "String", (Required) Phone number for nukkad registration
       "password": "String", (Required) Password for nukkad login
       "ownerPhoto": "String", (Optional) URL of the nukkad owner's photo
       "ownerEmail": "String", (Optional) Email address of the nukkad owner
       "ownerContactNumber": "String", (Optional) Additional contact number for the nukkad owner
       "currentAddress": "String", (Optional) Current address of the nukkad owner
       "permananetAddress": "String", (Optional) Permanent address of the nukkad owner
       "referred": "String", (Optional) Referral code used during registration (if applicable)
       "signature": "String", (Optional) URL of the nukkad owner's signature
       "bankDetails": {
           "accountNo": "String", (Optional) Nukkad's bank account number
           "IFSCcode": "String", (Optional) Nukkad's bank IFSC code
           "bankBranch": "String", (Optional) Nukkad's bank branch
       },
       "fssaiDetails": {
           "certificateNumber": "String", (Optional) FSSAI certificate number
           "expiryDate": "String", (Optional) FSSAI certificate expiry date (YYYY-MM-DD format)
           "certificateUrl": "String", (Optional) URL of the FSSAI certificate
       },
       "gstDetails": {
           "gstNumber": "String", (Optional) GST number
           "gstCertificateUrl": "String", (Optional) URL of the GST certificate
       },
       "kycDetails": {
           "aadharNumber": "String", (Optional) Aadhar number (masked for privacy)
           "panNumber": "String", (Optional) PAN number (masked for privacy)
       },
       "cuisines": "[String]", (Optional) Array of cuisines offered by the nukkad
       "operationalHours": "String", (Optional) Nukkad's operational hours
       "restaurantMenuImages": "[String]", (Optional) Array of URLs for restaurant menu images
       "restaurantImages": "[String]", (Optional) Array of URLs for restaurant images
       "foodImages": "[String]", (Optional) Array of URLs for food images
   }
   ```
* **Response Body:**
   ```json
   {
       "message": "String", (Success/Error message)
       "executed": Boolean (true if successful, false otherwise)
   }
   ```
* **Description:** Registers a new nukkad user on the NukkadFoods platform.

**2. Login**

* **Endpoint:** `/api/auth/login` (POST)
* **Request Body:**
   ```json
   {
       "phoneNumber": "String", (Required) Registered phone number of the nukkad
       "password": "String", (Required) Password for nukkad login
   }
   ```
* **Response Body:**
   ```json
   {
       "message": "String", (Login success/failure message)
       "executed": Boolean (true if successful, false otherwise)
   }
   ```
* **Description:** Enables nukkad users to log in to their NukkadFoods accounts.


## NukkadFoods API Documentation (Continued)

### Order Management APIs (Continued)

**1. Create Order (Continued)**

* **Response Body:**
   ```json
   {
       "message": "String", (Success/Error message)
       "order": { (Order object if successful)
           "orderId": "String",
           "date": "String",
           "time": "String",
           "orderByid": "String",
           "orderByName": "String",
           "status": "String",
           "items": [{
               "itemId": "String",
               "itemName": "String",
               "itemQuantity": "Number",
               "unitCost": "Number"
           }]
       }
   }
   ```
* **Description:** Creates a new order on the NukkadFoods platform.

**2. Get All Orders**

* **Endpoint:** `/api/orders/` (GET)
* **Request Body:** None
* **Response Body:**
   ```json
   {
       "orders": [{ (Array of order objects)
           "orderId": "String",
           "date": "String",
           "time": "String",
           "orderByid": "String",
           "orderByName": "String",
           "status": "String",
           "items": [{
               "itemId": "String",
               "itemName": "String",
               "itemQuantity": "Number",
               "unitCost": "Number"
           }]
       }]
   }
   ```
* **Description:** Retrieves all orders from the database.

**3. Get Order by ID**

* **Endpoint:** `/api/orders/:orderId` (GET)
* **Request Body:** None
* **Path Parameter:**
    * `orderId`: Unique ID of the order to be retrieved (Required)
* **Response Body:**
   ```json
   {
       "order": { (Order object if successful, null otherwise)
           "orderId": "String",
           "date": "String",
           "time": "String",
           "orderByid": "String",
           "orderByName": "String",
           "status": "String",
           "items": [{
               "itemId": "String",
               "itemName": "String",
               "itemQuantity": "Number",
               "unitCost": "Number"
           }]
       }
       "message": "String", (Error message if order not found)
   }
   ```
* **Description:** Retrieves a specific order by its unique ID.

**4. Update Order by ID**

* **Endpoint:** `/api/orders/:orderId` (PUT)
* **Request Body:**
   ```json
   { (Update data for the order)
       "status": "String" (Optional),
       // Add other fields you want to allow updating (e.g., items, delivery address)
   }
   ```
* **Path Parameter:**
    * `orderId`: Unique ID of the order to be updated (Required)
* **Response Body:**
   ```json
   {
       "message": "String", (Success/Error message)
       "order": { (Updated order object if successful, null otherwise)
           "orderId": "String",
           "date": "String",
           "time": "String",
           "orderByid": "String",
           "orderByName": "String",
           "status": "String",
           "items": [{
               "itemId": "String",
               "itemName": "String",
               "itemQuantity": "Number",
               "unitCost": "Number"
           }]
       }
   }
   ```
* **Description:** Updates an existing order by its unique ID. Update only the fields included in the request body.

**Note:** Remember to replace placeholders like `String` and `Number` with actual data types in your implementation.
