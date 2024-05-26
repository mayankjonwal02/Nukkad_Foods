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


## Get User by ID

### Description
This endpoint allows you to retrieve a user's information by their unique identifier (ID).

### Endpoint
```
POST /api/auth/getUser/:id
```

### Parameters
- `id` (required): The unique identifier of the user to retrieve.

### Request
```
POST /api/auth/getUser/664094be461dc7c1a3cd4887
```

### Responses

- **200 OK**
  - **Content-Type:** application/json
  - **Body:**
    ```json
    {
      "message": "User Found",
      "executed": true,
      "user": {
        "_id": "664094be461dc7c1a3cd4887",
        "username": "example_user",
        "email": "user@example.com",
        "createdAt": "2024-05-17T12:00:00.000Z",
        "updatedAt": "2024-05-17T13:00:00.000Z"
        // Other user properties
      }
    }
    ```
- **404 Not Found**
  - **Content-Type:** application/json
  - **Body:**
    ```json
    {
      "message": "User Doesn't Exist",
      "executed": false
    }
    ```
- **500 Internal Server Error**
  - **Content-Type:** application/json
  - **Body:**
    ```json
    {
      "message": "Internal server error",
      "executed": false
    }
    ```

### Example Usage

```bash
curl -X POST http://localhost:3000/api/auth/getUser/664094be461dc7c1a3cd4887
```

### Notes
- Replace `:id` in the endpoint URL with the actual unique identifier of the user you want to retrieve.



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
       "paymentMethod" : "{ type: String, required: true }",
       "totalCost": "{ type: Number, required: true }",
       "gst": "{ type: Number, required: true }",
       "itemAmount": "{ type: Number, required: true }",
       "deliveryCharge": "{ type: Number, required: true }",
       "convinenceFee": "{ type: Number, required: true }"
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



### DELETE /api/order/orders/:uid/:orderId

**Description:**

This endpoint is used to delete a specific order with the given `orderId` belonging to the user with the specified `uid`. The order is removed from the user's orders array and moved to a separate collection for cancelled orders.

**Request:**

- Method: DELETE
- Path: `/api/order/orders/:uid/:orderId`
- Parameters:
  - `uid` (string, required): The unique identifier of the user.
  - `orderId` (string, required): The unique identifier of the order to be deleted.

**Request Body:**

This endpoint does not expect any request body.

**Response:**

- Status Code: 200 OK
- Status Code: 404 Not Found
- Status Code: 500 Internal Server Error

**Response Body (Success):**

```json
{
  "message": "Order deleted successfully",
  "order": {
    "orderId": "5fc16a45c3a7c80f889a1f12",
    "date": "2024-01-01",
    "time": "12:00 PM",
    "orderByid": "user123",
    "orderByName": "John Doe",
    "status": "Cancelled",
    "items": [
      {
        "itemId": "item1",
        "itemName": "Burger",
        "itemQuantity": 2,
        "unitCost": 5.99
      },
      {
        "itemId": "item2",
        "itemName": "Pizza",
        "itemQuantity": 1,
        "unitCost": 10.99
      }
    ]
  }
}
```

**Response Body (Order Not Found):**

```json
{
  "message": "Order not found"
}
```

**Response Body (Error):**

```json
{
  "message": "Internal server error"
}
```



### Menu API

#### Base URL
```
/api/menu
```

### Endpoints

#### 1. Save Menu Item

**URL**: `/api/menu/saveMenuItem`

**Method**: `POST`

**Description**: Adds a new menu item to the specified category and subcategory.

**Request Body**:
```json
{
  "uid": "string",
  "category": "string",
  "subCategory": "string",
  "menuItem": {
    "menuItemName": "string",
    "menuItemImageURL": "string",
    "servingInfo": "string",
    "menuItemCost": number,
    "inStock": boolean,
    "timeToPrepare": number
  }
}
```

**Response**:

**Success (201)**:
```json
{
  "message": "Menu item added successfully"
}
```

**Error (500)**:
```json
{
  "error": "Error message"
}
```

#### 2. Get Menu Items

**URL**: `/api/menu/getMenuItem/:uid`

**Method**: `GET`

**Description**: Retrieves the menu items for the specified user ID. Can filter by category and subcategory if provided.

**Parameters**:
- `uid` (string): User ID

**Optional Query Parameters**:
- `category` (string): Category name
- `subCategory` (string): Subcategory name

**Response**:

**Success (200)**:

- If neither `category` nor `subCategory` is provided:
```json
{
  "menuItems": [
    {
      "category": "string",
      "subCategory": [
        {
          "subCategoryName": "string",
          "menuItems": [
            {
              "menuItemName": "string",
              "menuItemImageURL": "string",
              "servingInfo": "string",
              "menuItemCost": number,
              "inStock": boolean,
              "timeToPrepare": number
            }
          ]
        }
      ]
    }
  ]
}
```

- If only `category` is provided:
```json
{
  "subCategories": [
    {
      "subCategoryName": "string",
      "menuItems": [
        {
          "menuItemName": "string",
          "menuItemImageURL": "string",
          "servingInfo": "string",
          "menuItemCost": number,
          "inStock": boolean,
          "timeToPrepare": number
        }
      ]
    }
  ]
}
```

- If both `category` and `subCategory` are provided:
```json
{
  "menuItems": [
    {
      "menuItemName": "string",
      "menuItemImageURL": "string",
      "servingInfo": "string",
      "menuItemCost": number,
      "inStock": boolean,
      "timeToPrepare": number
    }
  ]
}
```

**Error (404)**:
```json
{
  "message": "Menu items not found"
}
```

**Error (500)**:
```json
{
  "error": "Error message"
}
```

#### 3. Update Menu Item

**URL**: `/api/menu/updateMenuItem/:uid/:category/:subCategory/:menuitemid`

**Method**: `PUT`

**Description**: Updates an existing menu item in the specified category and subcategory.

**Parameters**:
- `uid` (string): User ID
- `category` (string): Category name
- `subCategory` (string): Subcategory name
- `menuitemid` (string): Menu item ID

**Request Body**:
```json
{
  "updatedata": {
    "menuItemName": "string",
    "menuItemImageURL": "string",
    "servingInfo": "string",
    "menuItemCost": number,
    "inStock": boolean,
    "timeToPrepare": number
  }
}
```

**Response**:

**Success (200)**:
```json
{
  "message": "Menu item updated successfully"
}
```

**Error (404)**:
```json
{
  "message": "Menu item not found"
}
```

**Error (500)**:
```json
{
  "error": "Error message"
}
```

#### 4. Delete Menu Item

**URL**: `/api/menu/deleteMenuItem/:uid/:category/:subCategory/:menuitemid`

**Method**: `DELETE`

**Description**: Deletes an existing menu item from the specified category and subcategory.

**Parameters**:
- `uid` (string): User ID
- `category` (string): Category name
- `subCategory` (string): Subcategory name
- `menuitemid` (string): Menu item ID

**Response**:

**Success (200)**:
```json
{
  "message": "Menu item deleted successfully"
}
```

**Error (404)**:
```json
{
  "message": "Menu item not found"
}
```

**Error (500)**:
```json
{
  "error": "Error message"
}
```





### SMS API Documentation

### Endpoints

#### Send SMS
**Endpoint:**
```
POST /api/sms/sendSMS
```

**Description:**
This endpoint sends an SMS message to a specified phone number.

**Request Body:**
```json
{
    "to": "+1234567890",
    "body": "Your message here"
}
```

- `to`: The recipient's phone number in E.164 format (required).
- `body`: The text message to be sent (required).

**Response:**

- **Success (200)**:
    ```json
    {
        "message": "SMS sent successfully",
        "Response": {
            "sid": "SMXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX",
            "date_created": "Thu, 30 Jul 2015 20:12:31 +0000",
            "date_updated": "Thu, 30 Jul 2015 20:12:33 +0000",
            "date_sent": "Thu, 30 Jul 2015 20:12:33 +0000",
            "account_sid": "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX",
            "to": "+1234567890",
            "from": "+12097205544",
            "body": "Your message here",
            "status": "sent",
            "num_segments": "1",
            "num_media": "0",
            "direction": "outbound-api",
            "api_version": "2010-04-01",
            "price": null,
            "price_unit": "USD",
            "error_code": null,
            "error_message": null,
            "uri": "/2010-04-01/Accounts/ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/Messages/SMXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX.json",
            "subresource_uris": {
                "media": "/2010-04-01/Accounts/ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/Messages/SMXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/Media.json"
            }
        }
    }
    ```

- **Error (500)**:
    ```json
    {
        "error": "Error message explaining what went wrong"
    }
    ```



### **User Sign-Up**

**Endpoint:** `/api/auth/userSignUp`

**Method:** `POST`

**Description:** Creates a new user account.

**Request Body:**

```json
{
    "username": "string",
    "email": "string",
    "contact": "string",
    "password": "string",
    "latitude": "number",
    "longitude": "number",
    "houseFlatNo": "string",
    "area": "string",
    "colony": "string (optional)",
    "hint": "string",
    "saveAs": "string"
}
```

**Responses:**

- **200 OK**

  ```json
  {
      "message": "User Added Successfully",
      "executed": true
  }
  ```

- **400 Bad Request**

  ```json
  {
      "message": "Email already exists",
      "executed": false
  }
  ```

  ```json
  {
      "message": "Contact number already exists",
      "executed": false
  }
  ```

- **500 Internal Server Error**

  ```json
  {
      "message": "Error message",
      "executed": false
  }
  ```

---

### **User Login**

**Endpoint:** `/api/auth/userLogin`

**Method:** `POST`

**Description:** Authenticates a user based on contact and password.

**Request Body:**

```json
{
    "contact": "string",
    "password": "string"
}
```

**Responses:**

- **200 OK**

  ```json
  {
      "message": "Login Successful",
      "user": {
          "username": "string",
          "email": "string",
          "contact": "string",
          "latitude": "number",
          "longitude": "number",
          "houseFlatNo": "string",
          "area": "string",
          "colony": "string",
          "hint": "string",
          "saveAs": "string",
          "ordersData": "array"
      },
      "executed": true
  }
  ```

- **400 Bad Request**

  ```json
  {
      "message": "Invalid contact or password",
      "executed": false
  }
  ```

- **500 Internal Server Error**

  ```json
  {
      "message": "Error message",
      "executed": false
  }
  ```

---

### **Get User by ID**

**Endpoint:** `/api/auth/getUserByID/:id`

**Method:** `POST`

**Description:** Retrieves user information based on user ID.

**URL Params:**

- **id:** `string` (User ID)

**Responses:**

- **200 OK**

  ```json
  {
      "user": {
          "username": "string",
          "email": "string",
          "contact": "string",
          "latitude": "number",
          "longitude": "number",
          "houseFlatNo": "string",
          "area": "string",
          "colony": "string",
          "hint": "string",
          "saveAs": "string",
          "ordersData": "array"
      },
      "executed": true
  }
  ```

- **404 Not Found**

  ```json
  {
      "message": "User not found",
      "executed": false
  }
  ```

- **500 Internal Server Error**

  ```json
  {
      "message": "Error message",
      "executed": false
  }
  ```

---

### **Update User by ID**

**Endpoint:** `/api/auth/updateUserById`

**Method:** `POST`

**Description:** Updates user information based on user ID and provided data.

**Request Body:**

```json
{
    "_id": "string",
    "updateData": {
        "key1": "value1",
        "key2": "value2",
        // ...
    }
}
```

**Responses:**

- **200 OK**

  ```json
  {
      "message": "User updated successfully",
      "executed": true
  }
  ```

- **404 Not Found**

  ```json
  {
      "message": "User not found",
      "executed": false
  }
  ```

- **500 Internal Server Error**

  ```json
  {
      "message": "Error message",
      "executed": false
  }
  ```

### API Documentation for Subscription Management

#### Base URL
```
/api/subscribe
```

### Endpoints

#### 1. Subscribe

**URL**: `/api/subscribe/subscribe`

**Method**: `POST`

**Description**: Creates or updates a subscription for a restaurant.

**Request Body**:
```json
{
  "restaurantId": "string",
  "amount": number,
  "duration": "string"
}
```

**Response**:

**Success (201)**:
```json
{
  "message": "Subscription added successfully"
}
```

**Error (500)**:
```json
{
  "error": "Error message"
}
```

#### 2. Get Subscription

**URL**: `/api/subscribe/subscribe/:restaurantId`

**Method**: `GET`

**Description**: Retrieves the subscription details for a specified restaurant.

**Parameters**:
- `restaurantId` (string): Restaurant ID

**Response**:

**Success (200)**:
```json
{
  "restaurantId": "string",
  "amount": number,
  "duration": "string",
  "createdAt": "date",
  "updatedAt": "date"
}
```

**Error (404)**:
```json
{
  "message": "Subscription not found"
}
```

**Error (500)**:
```json
{
  "error": "Error message"
}
```

#### 3. Update Subscription

**URL**: `/api/subscribe/subscribe`

**Method**: `PUT`

**Description**: Updates an existing subscription for a restaurant.

**Request Body**:
```json
{
  "restaurantId": "string",
  "amount": number,
  "duration": "string"
}
```

**Response**:

**Success (200)**:
```json
{
  "message": "Subscription updated successfully"
}
```

**Error (404)**:
```json
{
  "message": "Subscription not found"
}
```

**Error (500)**:
```json
{
  "error": "Error message"
}
```


### API Documentation for Adds Management

#### Base URL
```
/api/adds
```

### Endpoints

#### 1. Add Adds

**URL**: `/api/adds/addAdds`

**Method**: `POST`

**Description**: Creates a new advertisement for a restaurant.

**Request Body**:
```json
{
  "restaurantId": "string",
  "amount": number,
  "startDate": "string (ISO 8601 format)",
  "endDate": "string (ISO 8601 format)"
}
```

**Response**:

**Success (201)**:
```json
{
  "_id": "string",
  "restaurantId": "string",
  "amount": number,
  "startDate": "string",
  "endDate": "string",
  "createdAt": "string",
  "updatedAt": "string",
  "__v": number
}
```

**Error (400)**:
```json
{
  "error": "Error message"
}
```

#### 2. Get Adds

**URL**: `/api/adds/getAdds/:restaurantId`

**Method**: `GET`

**Description**: Retrieves all advertisements for a specific restaurant.

**Parameters**:
- `restaurantId` (string): Restaurant ID

**Response**:

**Success (200)**:
```json
{
  "adds": [
    {
      "_id": "string",
      "restaurantId": "string",
      "amount": number,
      "startDate": "string",
      "endDate": "string",
      "createdAt": "string",
      "updatedAt": "string",
      "__v": number
    }
  ],
  "status": "success"
}
```

**Error (404)**:
```json
{
  "error": "Advertisement not found"
}
```

**Error (500)**:
```json
{
  "error": "Error message"
}
```

#### 3. Update Adds

**URL**: `/api/adds/updateAdds`

**Method**: `PUT`

**Description**: Updates an existing advertisement for a restaurant.

**Request Body**:
```json
{
  "restaurantId": "string",
  "amount": number,
  "startDate": "string (ISO 8601 format)",
  "endDate": "string (ISO 8601 format)"
}
```

**Response**:

**Success (200)**:
```json
{
  "adds": {
    "_id": "string",
    "restaurantId": "string",
    "amount": number,
    "startDate": "string",
    "endDate": "string",
    "createdAt": "string",
    "updatedAt": "string",
    "__v": number
  },
  "status": "success"
}
```

**Error (404)**:
```json
{
  "error": "Advertisement not found"
}
```

**Error (500)**:
```json
{
  "error": "Error message"
}
```

#### 4. Delete Adds

**URL**: `/api/adds/deleteAdds/:restaurantId`

**Method**: `DELETE`

**Description**: Deletes an existing advertisement for a restaurant.

**Parameters**:
- `restaurantId` (string): Restaurant ID

**Response**:

**Success (200)**:
```json
{
  "adds": {
    "_id": "string",
    "restaurantId": "string",
    "amount": number,
    "startDate": "string",
    "endDate": "string",
    "createdAt": "string",
    "updatedAt": "string",
    "__v": number
  },
  "status": "success"
}
```

**Error (404)**:
```json
{
  "error": "Advertisement not found"
}
```

**Error (500)**:
```json
{
  "error": "Error message"
}
```

### Summary:
1. **POST `/api/adds/addAdds`**: Creates a new advertisement.
2. **GET `/api/adds/getAdds/:restaurantId`**: Retrieves all advertisements for a specific restaurant.
3. **PUT `/api/adds/updateAdds`**: Updates an existing advertisement.
4. **DELETE `/api/adds/deleteAdds/:restaurantId`**: Deletes an existing advertisement.



