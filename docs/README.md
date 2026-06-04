# E-Commerce Platform with Secure Payment Gateway Integration

A full-stack e-commerce platform with integrated payment gateways (Stripe and PayPal) designed with enterprise-level security.

## Features

- **User Authentication**: Secure JWT-based authentication
- **Product Management**: Browse, search, and filter products
- **Shopping Cart**: Add products to cart and manage items
- **Order Management**: Place and track orders
- **Secure Payments**: Integration with Stripe and PayPal
- **Data Encryption**: End-to-end encryption for sensitive data
- **Security**: CORS, Helmet.js, input validation, and more

## Project Structure

```
E-Commerce Platform with Secure Payment Gateway Integration/
├── backend/               # Node.js/Express backend
├── frontend/              # React frontend
├── database/              # SQL migrations and seeds
└── docs/                  # Documentation
```

## Getting Started

### Backend Setup

1. Navigate to backend directory:
   ```bash
   cd backend
   ```

2. Install dependencies:
   ```bash
   npm install
   ```

3. Create `.env` file from `.env.example` and configure:
   ```bash
   cp .env.example .env
   ```

4. Start the server:
   ```bash
   npm run dev
   ```

### Frontend Setup

1. Navigate to frontend directory:
   ```bash
   cd frontend
   ```

2. Install dependencies:
   ```bash
   npm install
   ```

3. Create `.env` file from `.env.example` and configure:
   ```bash
   cp .env.example .env
   ```

4. Start the development server:
   ```bash
   npm run dev
   ```

## Database Setup

1. Create MySQL database
2. Run migrations:
   ```bash
   mysql -u root -p ecommerce < database/migrations/001_create_users.sql
   mysql -u root -p ecommerce < database/migrations/002_create_products.sql
   mysql -u root -p ecommerce < database/migrations/003_create_orders.sql
   mysql -u root -p ecommerce < database/migrations/004_create_payments.sql
   ```

3. Seed initial data:
   ```bash
   mysql -u root -p ecommerce < database/seeds/initialData.sql
   ```

## API Documentation

See [API.md](./API.md) for detailed API endpoints documentation.

## Payment Gateway Integration

See [PAYMENT_GATEWAY.md](./PAYMENT_GATEWAY.md) for payment gateway setup and integration details.

## Security

See [SECURITY.md](./SECURITY.md) for security best practices and implementation details.

## Setup Guide

See [SETUP.md](./SETUP.md) for complete setup and deployment instructions.

## Technologies

### Backend
- Node.js
- Express.js
- MongoDB/MySQL
- JWT
- Stripe SDK
- PayPal SDK
- Bcrypt.js

### Frontend
- React
- React Router
- Axios
- Stripe.js
- CSS3

## License

ISC
