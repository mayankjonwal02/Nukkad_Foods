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



### POST /api/menu/saveMenuItem

**Description:**
This endpoint is used to save a new menu item for a specific user.

**Request:**
- Method: POST
- Path: `/api/menu/saveMenuItem`
- Request Body:
  ```json
  {
    "uid": "user123",
    "menuitem": {
      "menuitemName": "Burger",
      "menuitemImageURL": "burger.jpg",
      "servingInfo": "Large",
      "menuitemCost": 5.99,
      "inStock": true,
      "timeToPrepare": 10
    }
  }
  ```

**Response:**
- Status Code: 201 Created
- Status Code: 500 Internal Server Error

**Response Body (Success):**
```json
{
  "message": "Menu item added successfully"
}
```

---

### GET /api/menu/getMenuItem/:uid

**Description:**
This endpoint is used to retrieve all menu items for a specific user.

**Request:**
- Method: GET
- Path: `/api/menu/getMenuItem/user123`

**Response:**
- Status Code: 200 OK
- Status Code: 404 Not Found
- Status Code: 500 Internal Server Error

**Response Body (Success):**
```json
{
  "menuItems": [
    {
      "menuitemName": "Burger",
      "menuitemImageURL": "burger.jpg",
      "servingInfo": "Large",
      "menuitemCost": 5.99,
      "inStock": true,
      "timeToPrepare": 10
    },
    {
      "menuitemName": "Pizza",
      "menuitemImageURL": "pizza.jpg",
      "servingInfo": "Medium",
      "menuitemCost": 9.99,
      "inStock": true,
      "timeToPrepare": 15
    }
  ]
}
```

---

### PUT /api/menu/updateMenuItem/:uid/:menuitemid

**Description:**
This endpoint is used to update a specific menu item for a user.

**Request:**
- Method: PUT
- Path: `/api/menu/updateMenuItem/user123/123456`
- Request Body:
  ```json
  {
    "updatedata": {
      "menuitemName": "New Burger",
      "menuitemCost": 6.99
    }
  }
  ```

**Response:**
- Status Code: 200 OK
- Status Code: 404 Not Found
- Status Code: 500 Internal Server Error

**Response Body (Success):**
```json
{
  "message": "Menu item updated successfully"
}
```

---

### DELETE /api/menu/deleteMenuItem/:uid/:menuitemid

**Description:**
This endpoint is used to delete a specific menu item for a user.

**Request:**
- Method: DELETE
- Path: `/api/menu/deleteMenuItem/user123/123456`

**Response:**
- Status Code: 200 OK
- Status Code: 404 Not Found
- Status Code: 500 Internal Server Error

**Response Body (Success):**
```json
{
  "message": "Menu item deleted successfully"
}
```

