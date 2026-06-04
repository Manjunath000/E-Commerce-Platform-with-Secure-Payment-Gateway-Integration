# API Documentation

## Authentication Endpoints

### Register User
- **Endpoint**: `POST /api/auth/register`
- **Description**: Register a new user
- **Body**:
  ```json
  {
    "email": "user@example.com",
    "password": "password123"
  }
  ```
- **Response**: `201 Created`

### Login
- **Endpoint**: `POST /api/auth/login`
- **Description**: Login user and get JWT token
- **Body**:
  ```json
  {
    "email": "user@example.com",
    "password": "password123"
  }
  ```
- **Response**: `200 OK`
  ```json
  {
    "token": "jwt_token_here"
  }
  ```

## Products Endpoints

### Get All Products
- **Endpoint**: `GET /api/products`
- **Description**: Get all available products
- **Response**: `200 OK`

### Get Product by ID
- **Endpoint**: `GET /api/products/:id`
- **Description**: Get specific product details
- **Response**: `200 OK`

### Create Product (Admin)
- **Endpoint**: `POST /api/products`
- **Description**: Create new product
- **Authentication**: Required
- **Body**:
  ```json
  {
    "name": "Product Name",
    "price": 99.99,
    "description": "Product description"
  }
  ```

## Orders Endpoints

### Get User Orders
- **Endpoint**: `GET /api/orders`
- **Description**: Get all orders for authenticated user
- **Authentication**: Required

### Create Order
- **Endpoint**: `POST /api/orders`
- **Description**: Create new order
- **Authentication**: Required
- **Body**:
  ```json
  {
    "items": [
      {
        "productId": 1,
        "quantity": 2
      }
    ],
    "shippingAddress": "123 Street, City"
  }
  ```

### Get Order by ID
- **Endpoint**: `GET /api/orders/:id`
- **Description**: Get specific order details
- **Authentication**: Required

## Payments Endpoints

### Create Stripe Payment Intent
- **Endpoint**: `POST /api/payments/stripe/create-payment-intent`
- **Description**: Create payment intent for Stripe
- **Authentication**: Required
- **Body**:
  ```json
  {
    "amount": 9999,
    "currency": "USD"
  }
  ```

### Create PayPal Payment
- **Endpoint**: `POST /api/payments/paypal/create-payment`
- **Description**: Create payment for PayPal
- **Authentication**: Required

### Execute PayPal Payment
- **Endpoint**: `POST /api/payments/paypal/execute-payment`
- **Description**: Execute PayPal payment
- **Authentication**: Required

### Verify Payment
- **Endpoint**: `POST /api/payments/verify`
- **Description**: Verify payment status
- **Authentication**: Required

## Error Responses

All endpoints return error responses in the following format:

```json
{
  "error": "Error message"
}
```

Common HTTP Status Codes:
- `200`: Success
- `201`: Created
- `400`: Bad Request
- `401`: Unauthorized
- `404`: Not Found
- `500`: Internal Server Error
