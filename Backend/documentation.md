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



# Order Management API Documentation

## Overview
This API provides endpoints to manage orders for the NukkadFoods application. The API supports operations to create, retrieve, update, and delete orders, as well as fetch all orders in the database.

## Base URL
`/api/order`

## Endpoints

### Create Order
**Endpoint:** `POST /api/order/createOrder`

**Description:** Create a new order for a user.

**Request Body:**
```json
{
  "uid": "string",
  "orderData": {
    "orderId": "string",
    "date": "2023-06-20T00:00:00.000Z",
    "time": "string",
    "paymentMethod": "string",
    "totalCost": 100,
    "gst": 10,
    "itemAmount": 90,
    "deliveryCharge": 5,
    "convinenceFee": 2,
    "orderByid": "string",
    "orderByName": "string",
    "status": "string",
    "deliveryAddress": "string",
    "items": [
      {
        "itemId": "string",
        "itemName": "string",
        "itemQuantity": 1,
        "unitCost": 45
      }
    ]
  }
}
```

**Response:**
- **Success:** 
  - Status Code: 200
  - Body:
    ```json
    {
      "message": "Order created successfully",
      "orders": [...]
    }
    ```
- **Failure:**
  - Status Code: 400
  - Body:
    ```json
    {
      "message": "Order with the same orderId already exists"
    }
    ```
  - Status Code: 500
  - Body:
    ```json
    {
      "message": "Internal server error"
    }
    ```

### Get Orders by User ID
**Endpoint:** `GET /api/order/orders/:uid`

**Description:** Retrieve all orders for a specific user.

**Response:**
- **Success:** 
  - Status Code: 200
  - Body:
    ```json
    {
      "orders": [...]
    }
    ```
- **Failure:**
  - Status Code: 500
  - Body:
    ```json
    {
      "message": "Internal server error"
    }
    ```

### Get Order by User ID and Order ID
**Endpoint:** `GET /api/order/orders/:uid/:orderId`

**Description:** Retrieve a specific order for a user by order ID.

**Response:**
- **Success:** 
  - Status Code: 200
  - Body:
    ```json
    {
      "order": {...}
    }
    ```
- **Failure:**
  - Status Code: 404
  - Body:
    ```json
    {
      "message": "Order not found"
    }
    ```
  - Status Code: 500
  - Body:
    ```json
    {
      "message": "Internal server error"
    }
    ```

### Update Order by User ID and Order ID
**Endpoint:** `PUT /api/order/orders/:uid/:orderId`

**Description:** Update a specific order for a user by order ID.

**Request Body:**
```json
{
  "updateData": {
    "key": "value"
  }
}
```

**Response:**
- **Success:** 
  - Status Code: 200
  - Body:
    ```json
    {
      "message": "Order updated successfully",
      "order": {...}
    }
    ```
- **Failure:**
  - Status Code: 404
  - Body:
    ```json
    {
      "message": "Order not found"
    }
    ```
  - Status Code: 500
  - Body:
    ```json
    {
      "message": "Internal server error"
    }
    ```

### Delete Order by User ID and Order ID
**Endpoint:** `DELETE /api/order/orders/:uid/:orderId`

**Description:** Delete a specific order for a user by order ID.

**Response:**
- **Success:** 
  - Status Code: 200
  - Body:
    ```json
    {
      "message": "Order deleted successfully",
      "order": {...}
    }
    ```
- **Failure:**
  - Status Code: 404
  - Body:
    ```json
    {
      "message": "Order not found"
    }
    ```
  - Status Code: 500
  - Body:
    ```json
    {
      "message": "Internal server error"
    }
    ```

### Get All Orders
**Endpoint:** `GET /api/order/getAllOrders`

**Description:** Retrieve all orders in the database.

**Response:**
- **Success:** 
  - Status Code: 200
  - Body:
    ```json
    {
      "orders": [...]
    }
    ```
- **Failure:**
  - Status Code: 500
  - Body:
    ```json
    {
      "message": "Internal server error"
    }
    ```

## Error Handling
- **400 Bad Request:** The server could not understand the request due to invalid syntax.
- **404 Not Found:** The server can not find the requested resource.
- **500 Internal Server Error:** The server has encountered a situation it doesn't know how to handle.

## Models

### Order Schema
```json
{
  "uid": "string",
  "orders": [
    {
      "orderId": "string",
      "date": "2023-06-20T00:00:00.000Z",
      "time": "string",
      "paymentMethod": "string",
      "totalCost": 100,
      "gst": 10,
      "itemAmount": 90,
      "deliveryCharge": 5,
      "convinenceFee": 2,
      "orderByid": "string",
      "orderByName": "string",
      "status": "string",
      "deliveryAddress": "string",
      "items": [
        {
          "itemId": "string",
          "itemName": "string",
          "itemQuantity": 1,
          "unitCost": 45
        }
      ]
    }
  ]
}
```

## Notes
- Ensure to replace placeholder strings (e.g., `"string"`, `100`) with actual values in request bodies.





# Menu API Documentation

## Base URL
```
/api/menu
```

## 1. Fetch All Categories

Retrieves all categories for a given restaurant.

- **Endpoint:** `/fetchAllCategories`
- **Method:** POST
- **Request Body:**
```json
{
  "uid": "restaurant123"
}
```
- **Response Body:**
```json
{
  "categories": ["Appetizers", "Main Course", "Desserts"],
  "message": "Categories fetched successfully"
}
```

## 2. Add Category

Adds a new category to a restaurant's menu.

- **Endpoint:** `/addcategory`
- **Method:** POST
- **Request Body:**
```json
{
  "uid": "restaurant123",
  "category": "Beverages"
}
```
- **Response Body:**
```json
{
  "message": "Category added successfully",
  "existingMenuItem": {
    "uid": "restaurant123",
    "menuItemList": [
      {
        "category": "Beverages",
        "subCategory": []
      }
    ]
  }
}
```

## 3. Delete Category

Removes a category from a restaurant's menu.

- **Endpoint:** `/deleteCategory`
- **Method:** POST
- **Request Body:**
```json
{
  "uid": "restaurant123",
  "category": "Beverages"
}
```
- **Response Body:**
```json
{
  "message": "Category deleted successfully"
}
```

## 4. Fetch All Subcategories

Retrieves all subcategories for a given category in a restaurant's menu.

- **Endpoint:** `/fetchAllSubCategories`
- **Method:** POST
- **Request Body:**
```json
{
  "uid": "restaurant123",
  "category": "Appetizers"
}
```
- **Response Body:**
```json
{
  "subCategories": ["Soups", "Salads", "Starters"]
}
```

## 5. Add Subcategory

Adds a new subcategory to a category in a restaurant's menu.

- **Endpoint:** `/addSubCategory`
- **Method:** POST
- **Request Body:**
```json
{
  "uid": "restaurant123",
  "category": "Appetizers",
  "subCategory": "Finger Foods"
}
```
- **Response Body:**
```json
{
  "message": "Sub-category added successfully",
  "subCategoryObj": {
    "subCategoryName": "Finger Foods",
    "menuItems": []
  }
}
```

## 6. Delete Subcategory

Removes a subcategory from a category in a restaurant's menu.

- **Endpoint:** `/deleteSubCategory`
- **Method:** POST
- **Request Body:**
```json
{
  "uid": "restaurant123",
  "category": "Appetizers",
  "subCategory": "Finger Foods"
}
```
- **Response Body:**
```json
{
  "message": "Sub-category deleted successfully"
}
```

## 7. Save Menu Item

Adds a new menu item to a subcategory.

- **Endpoint:** `/saveMenuItem`
- **Method:** POST
- **Request Body:**
```json
{
  "uid": "restaurant123",
  "category": "Main Course",
  "subCategory": "Pasta",
  "menuItem": {
    "name": "Spaghetti Carbonara",
    "description": "Classic Italian pasta dish with eggs, cheese, and bacon",
    "price": 12.99,
    "isAvailable": true
  }
}
```
- **Response Body:**
```json
{
  "message": "Menu item added successfully",
  "existingMenuItem": {
    "uid": "restaurant123",
    "menuItemList": [
      {
        "category": "Main Course",
        "subCategory": [
          {
            "subCategoryName": "Pasta",
            "menuItems": [
              {
                "name": "Spaghetti Carbonara",
                "description": "Classic Italian pasta dish with eggs, cheese, and bacon",
                "price": 12.99,
                "isAvailable": true
              }
            ]
          }
        ]
      }
    ]
  }
}
```

## 8. Get Menu Items

Retrieves menu items based on the provided parameters.

- **Endpoint:** `/getMenuItem/:uid`
- **Method:** POST
- **Parameters:**
  - `uid`: Restaurant ID
- **Request Body:** (Optional)
```json
{
  "category": "Main Course",
  "subCategory": "Pasta"
}
```
- **Response Body:**
```json
{
  "menuItems": [
    {
      "name": "Spaghetti Carbonara",
      "description": "Classic Italian pasta dish with eggs, cheese, and bacon",
      "price": 12.99,
      "isAvailable": true
    }
  ]
}
```

## 9. Update Menu Item

Updates an existing menu item.

- **Endpoint:** `/updateMenuItem/:uid/:category/:subCategory/:menuitemid`
- **Method:** PUT
- **Parameters:**
  - `uid`: Restaurant ID
  - `category`: Category name
  - `subCategory`: Subcategory name
  - `menuitemid`: Menu item ID
- **Request Body:**
```json
{
  "updatedata": {
    "price": 13.99,
    "isAvailable": false
  }
}
```
- **Response Body:**
```json
{
  "message": "Menu item updated successfully"
}
```

## 10. Delete Menu Item

Removes a menu item from a subcategory.

- **Endpoint:** `/deleteMenuItem/:uid/:category/:subCategory/:menuitemid`
- **Method:** POST
- **Parameters:**
  - `uid`: Restaurant ID
  - `category`: Category name
  - `subCategory`: Subcategory name
  - `menuitemid`: Menu item ID
- **Response Body:**
```json
{
  "message": "Menu item deleted successfully"
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
    "saveAs": "string",
    "gender":"string",
    "userImage":"Buffer",
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




### Complaint API

#### Base URL:
```
/api/complaint
```

#### Endpoints:

1. **Add Complaint**
   - Method: POST
   - URL: /addComplaint
   - Description: Add a new complaint for a restaurant.
   - Request Body:
     ```json
     {
         "restaurantID": "123",
         "status": "Processing",
         "orderID": "456",
         "description": "Received wrong item",
         "complaintByID": "789",
         "designation": "Customer"
     }
     ```
   - Response Body (Success):
     ```json
     {
         "message": "Complaint added successfully",
         "complaint": {
             "_id": "617091f3d5309808cfc5f367",
             "status": "Processing",
             "orderID": "456",
             "description": "Received wrong item",
             "complaintByID": "789",
             "designation": "Customer",
             "createdAt": "2022-10-21T08:45:47.122Z",
             "updatedAt": "2022-10-21T08:45:47.122Z"
         }
     }
     ```
   - Response Body (Error):
     ```json
     {
         "error": "Internal Server Error"
     }
     ```

2. **Get Complaints by Restaurant ID**
   - Method: GET
   - URL: /getComplaint/:restaurantID
   - Description: Get all complaints for a specific restaurant.
   - Response Body (Success):
     ```json
     {
         "complaints": [
             {
                 "_id": "617091f3d5309808cfc5f367",
                 "status": "Processing",
                 "orderID": "456",
                 "description": "Received wrong item",
                 "complaintByID": "789",
                 "designation": "Customer",
                 "createdAt": "2022-10-21T08:45:47.122Z",
                 "updatedAt": "2022-10-21T08:45:47.122Z"
             },
             {
                 "_id": "617091f3d5309808cfc5f368",
                 "status": "Resolve",
                 "orderID": "457",
                 "description": "Delayed delivery",
                 "complaintByID": "790",
                 "designation": "Customer",
                 "createdAt": "2022-10-21T08:46:05.876Z",
                 "updatedAt": "2022-10-21T08:46:05.876Z"
             }
         ],
         "status": "success"
     }
     ```
   - Response Body (Error):
     ```json
     {
         "error": "Complaint database not found"
     }
     ```

3. **Update Complaint**
   - Method: PUT
   - URL: /updateComplaint/:restaurantID/:complaintID
   - Description: Update a complaint for a specific restaurant.
   - Request Body:
     ```json
     {
         "status": "Resolve",
         "description": "Issue resolved"
     }
     ```
   - Response Body (Success):
     ```json
     {
         "message": "Complaint updated successfully",
         "updatedComplaint": {
             "_id": "617091f3d5309808cfc5f367",
             "status": "Resolve",
             "orderID": "456",
             "description": "Issue resolved",
             "complaintByID": "789",
             "designation": "Customer",
             "createdAt": "2022-10-21T08:45:47.122Z",
             "updatedAt": "2022-10-21T09:00:22.537Z"
         }
     }
     ```
   - Response Body (Error):
     ```json
     {
         "error": "Complaint not found"
     }
     ```

4. **Delete Complaint**
   - Method: DELETE
   - URL: /deleteComplaint/:restaurantID/:complaintID
   - Description: Delete a complaint for a specific restaurant.
   - Response Body (Success):
     ```json
     {
         "message": "Complaint deleted successfully"
     }
     ```
   - Response Body (Error):
     ```json
     {
         "error": "Complaint not found"
     }
     ```




# Razorpay Payment API Documentation

## Base URL
```
https://your-api-domain.com/api/payment
```

## 1. Create Order

Creates a new order in Razorpay.

### Endpoint
```
POST /createOrder
```

### Request Body
| Field    | Type   | Description                            |
|----------|--------|----------------------------------------|
| amount   | number | Amount in the smallest currency unit   |
| currency | string | Currency code (e.g., INR, USD)         |

### Example Request
```json
{
  "amount": 50000,
  "currency": "INR"
}
```

### Success Response (200 OK)
```json
{
  "order": {
    "id": "order_ABCDefghIJKLmn",
    "entity": "order",
    "amount": 50000,
    "amount_paid": 0,
    "amount_due": 50000,
    "currency": "INR",
    "receipt": "order_1623660301",
    "status": "created",
    "attempts": 0,
    "created_at": 1623660301
  },
  "status": 200,
  "message": "Order created successfully",
  "executed": true
}
```

### Error Response (500 Internal Server Error)
```json
{
  "error": "Error message describing the issue",
  "executed": false
}
```

## 2. Verify Payment

Verifies the payment signature after a successful payment.

### Endpoint
```
POST /verifyPayment
```

### Request Body
| Field               | Type   | Description                       |
|---------------------|--------|-----------------------------------|
| razorpay_order_id   | string | Razorpay Order ID                 |
| razorpay_payment_id | string | Razorpay Payment ID               |
| razorpay_signature  | string | Signature provided by Razorpay    |

### Example Request
```json
{
  "razorpay_order_id": "order_ABCDefghIJKLmn",
  "razorpay_payment_id": "pay_ABCDefghIJKLmn",
  "razorpay_signature": "9ef4dffbfd84f1318f6739a3ce19f9d85851857ae648f114332d8401e0949a3d"
}
```

### Success Response (200 OK)
```json
{
  "status": 200,
  "message": "Payment verified successfully",
  "executed": true
}
```

### Error Response (400 Bad Request)
```json
{
  "status": 400,
  "message": "Payment verification failed",
  "executed": false
}
```

### Error Response (500 Internal Server Error)
```json
{
  "error": "Error message describing the issue",
  "executed": false
}
```

## Usage Notes

1. The `amount` in the Create Order API should be in the smallest currency unit. For example, for INR, the amount should be in paise (1 rupee = 100 paise).

2. The `currency` in the Create Order API should be a valid currency code supported by Razorpay.

3. After creating an order, use the returned `order.id` to initiate the payment on the client-side using Razorpay's JavaScript SDK.

4. After a successful payment, use the Verify Payment API to confirm the payment's authenticity.









### Payout API Documentation

#### API Endpoint

**Endpoint**: `/api/payment/createPayout`

**Method**: POST

#### Description

This API endpoint allows you to create a payout using Razorpay's Payout API. The payout will be created using a pre-configured fund account and the specified details in the request body.

#### Request

**URL**: `/api/payment/createPayout`

**Method**: POST

**Headers**:
- `Content-Type`: `application/json`

**Body Parameters**:

| Parameter          | Type    | Required | Description                                            |
|--------------------|---------|----------|--------------------------------------------------------|
| `amount`           | Number  | Yes      | The payout amount in the smallest currency unit (e.g., paise for INR) |
| `currency`         | String  | Yes      | The currency of the payout (e.g., "INR")               |
| `notes`            | Object  | No       | Any additional notes related to the payout (key-value pairs) |
| `fund_account_id`  | String  | Yes      | The fund account ID to which the payout will be made   |
| `mode`             | String  | Yes      | The mode of the payout (e.g., "IMPS", "NEFT", "RTGS", "UPI") |
| `purpose`          | String  | Yes      | The purpose of the payout (e.g., "refund", "payout")   |

**Environment Variables**:
- `ACCOUNT_NUMBER`: The account number from which the payout will be made. Ensure this is set in your environment variables.

#### Sample Request Body

```json
{
    "amount": 500,
    "currency": "INR",
    "fund_account_id": "fa_1234567890",
    "mode": "UPI",
    "purpose": "refund",
    "notes": {
        "note1": "This is a test payout",
        "note2": "For testing purposes"
    }
}
```

#### Response

**Success Response**:

- **Status Code**: 200 OK

```json
{
    "payout": {
        "id": "pout_1Aa00000000001",
        "entity": "payout",
        "fund_account_id": "fa_1234567890",
        "amount": 50000,
        "currency": "INR",
        "transaction_id": "txn_00000000000001",
        "created_at": 1609459200,
        "status": "processing",
        "purpose": "refund",
        "mode": "UPI",
        "reference_id": null,
        "notes": {
            "note1": "This is a test payout",
            "note2": "For testing purposes"
        }
    },
    "status": 200,
    "message": "Payout created successfully",
    "executed": true
}
```

**Error Response**:

- **Status Code**: 500 Internal Server Error

```json
{
    "error": {
        "code": "BAD_REQUEST_ERROR",
        "description": "Insufficient funds in account",
        "source": "business",
        "step": "currency",
        "reason": "The account does not have enough balance to process this payout"
    },
    "executed": false
}
```

### Example Usage

#### cURL

```sh
curl -X POST http://localhost:3000/api/payment/createPayout \
    -H "Content-Type: application/json" \
    -d '{
          "amount": 500,
          "currency": "INR",
          "fund_account_id": "fa_1234567890",
          "mode": "UPI",
          "purpose": "refund",
          "notes": {
              "note1": "This is a test payout",
              "note2": "For testing purposes"
          }
        }'
```

