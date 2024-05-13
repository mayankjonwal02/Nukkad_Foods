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



**API Documentation for NukkadFoods Order Management System**

**Introduction**

This API provides endpoints for managing orders within the NukkadFoods system. It allows users to create, retrieve, and update orders associated with a specific user ID (UID).


**API Endpoints**

**1. Create Order**

**Route:** `POST /api/order/createOrder`

**Request Body:**

```json
{
  "uid": "<user_id>",
  "orderData": {
    "orderId": "<unique_order_id>",
    "date": "<order_date_in_YYYY-MM-DD format>",
    "time": "<order_time>",
    "orderByid": "<id_of_the_user_who_placed_the_order>",
    "orderByName": "<name_of_the_user_who_placed_the_order>",
    "status": "<order_status>",
    "items": [
      {
        "itemId": "<item_id>",
        "itemName": "<item_name>",
        "itemQuantity": <number>,
        "unitCost": <number>
      },
      // ... more item objects
    ]
  }
}
```

**Response Body:**

```json
{
  "message": "Order created successfully",
  "orders": [
    // Array of all orders for the user (including the newly created one)
  ]
}
```

**Error Codes:**

* **400 (Bad Request):**
    * Missing required fields in the request body.
    * Order with the same `orderId` already exists for the user.

* **500 (Internal Server Error):**
    * Unexpected error during order creation.

**2. Get All Orders**

**Route:** `GET /api/order/orders`

**Request Body:**

```json
{
  "uid": "<uid>"
}
```

**Response Body:**

```json
{
  "orders": [
    // Array of all orders for the user
  ]
}
```

**Error Codes:**

* **500 (Internal Server Error):**
    * Unexpected error during order retrieval.

**3. Get Order by ID**

**Route:** `GET /api/order/orders/:uid/:orderId`

**Path Parameters:**

* `:uid`: User ID
* `:orderId`: Order ID

**Request Body:**

No request body required.

**Response Body:**

```json
{
  "order": {
    "orderId": "<unique_order_id>",
    "date": "<order_date_in_YYYY-MM-DD format>",
    "time": "<order_time>",
    "orderByid": "<id_of_the_user_who_placed_the_order>",
    "orderByName": "<name_of_the_user_who_placed_the_order>",
    "status": "<order_status>",
    "items": [
      {
        "itemId": "<item_id>",
        "itemName": "<item_name>",
        "itemQuantity": <number>,
        "unitCost": <number>
      },
      // ... more item objects
    ]
  }
}
```

**Error Codes:**

* **404 (Not Found):**
    * User with the provided UID does not exist.
    * Order with the provided `orderId` does not exist for the user.

* **500 (Internal Server Error):**
    * Unexpected error during order retrieval.

**4. Update Order**

**Route:** `PUT /api/order/orders/:uid/:orderId`

**Path Parameters:**

* `:uid`: User ID
* `:orderId`: Order ID

**Request Body:**

```json
{
  "updateData": {
    // Fields to update (e.g., "status", "items")
  }
}
```

**Response Body:**

```json
{
  "message": "Order updated successfully",

}
```
