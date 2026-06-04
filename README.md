# E-Commerce Platform with Secure Payment Gateway Integration

A comprehensive, production-ready e-commerce platform built with Node.js, React, and integrated with secure payment gateways (Stripe and PayPal).

## 🚀 Features

### Core E-Commerce Features
- **User Authentication** - Secure JWT-based user authentication and authorization
- **Product Management** - Browse, search, filter, and manage products
- **Shopping Cart** - Add/remove items and manage cart
- **Order Management** - Create, track, and manage orders
- **User Profiles** - Manage user information and order history

### Payment Gateway Integration
- **Stripe Integration** - Secure credit/debit card payments
- **PayPal Integration** - PayPal checkout support
- **Payment Verification** - Real-time payment status verification
- **Transaction History** - Detailed payment records and receipts

### Security Features
- **End-to-End Encryption** - AES-256 encryption for sensitive data
- **JWT Authentication** - Secure token-based authentication
- **Password Hashing** - Bcrypt.js for secure password storage
- **HTTPS/TLS** - Secure data transmission
- **Input Validation** - Comprehensive validation and sanitization
- **CORS Configuration** - Cross-origin resource sharing protection
- **Security Headers** - Helmet.js for additional security headers
- **PCI DSS Compliance** - Payment Card Industry compliance

## 📁 Project Structure

```
E-Commerce Platform with Secure Payment Gateway Integration/
├── backend/                          # Node.js/Express Backend
│   ├── config/                       # Configuration files
│   │   ├── database.js              # Database connection
│   │   ├── paymentGateway.js        # Payment gateway setup
│   │   └── environment.js           # Environment config
│   ├── routes/                       # API routes
│   │   ├── auth.js                  # Authentication routes
│   │   ├── products.js              # Product routes
│   │   ├── orders.js                # Order routes
│   │   └── payments.js              # Payment routes
│   ├── controllers/                  # Business logic
│   │   ├── authController.js
│   │   ├── productController.js
│   │   ├── orderController.js
│   │   └── paymentController.js
│   ├── middleware/                   # Express middleware
│   │   ├── auth.js                  # Authentication middleware
│   │   ├── errorHandler.js          # Error handling
│   │   └── validation.js            # Input validation
│   ├── models/                       # Data models
│   ├── utils/                        # Utility functions
│   │   ├── encryptionUtil.js        # Data encryption
│   │   └── paymentUtil.js           # Payment utilities
│   ├── server.js                     # Main server file
│   ├── package.json                 # Backend dependencies
│   └── .env.example                 # Environment template
│
├── frontend/                         # React Frontend
│   ├── public/
│   │   ├── index.html               # Main HTML file
│   │   └── favicon.ico
│   ├── src/
│   │   ├── components/              # React components
│   │   │   ├── Header.jsx           # Header component
│   │   │   ├── Footer.jsx           # Footer component
│   │   │   ├── ProductCard.jsx      # Product card
│   │   │   ├── Cart.jsx             # Shopping cart
│   │   │   └── PaymentForm.jsx      # Payment form
│   │   ├── pages/                   # Page components
│   │   │   ├── Home.jsx             # Home page
│   │   │   ├── Products.jsx         # Products listing
│   │   │   ├── ProductDetail.jsx    # Product details
│   │   │   ├── Cart.jsx             # Cart page
│   │   │   ├── Checkout.jsx         # Checkout page
│   │   │   ├── Payment.jsx          # Payment page
│   │   │   └── OrderConfirmation.jsx # Confirmation
│   │   ├── services/                # API services
│   │   │   ├── api.js               # API client
│   │   │   ├── authService.js       # Auth API
│   │   │   ├── productService.js    # Products API
│   │   │   ├── orderService.js      # Orders API
│   │   │   └── paymentService.js    # Payments API
│   │   ├── contexts/                # React contexts
│   │   │   └── AuthContext.jsx      # Auth context
│   │   ├── hooks/                   # Custom hooks
│   │   │   ├── useAuth.js           # Auth hook
│   │   │   ├── useCart.js           # Cart hook
│   │   │   └── useFetch.js          # Fetch hook
│   │   ├── styles/                  # CSS files
│   │   ├── App.jsx                  # Main App component
│   │   └── index.js                 # React entry point
│   ├── package.json                 # Frontend dependencies
│   ├── vite.config.js               # Vite configuration
│   └── .env.example                 # Environment template
│
├── database/                         # Database Schema
│   ├── migrations/                   # SQL migrations
│   │   ├── 001_create_users.sql
│   │   ├── 002_create_products.sql
│   │   ├── 003_create_orders.sql
│   │   └── 004_create_payments.sql
│   └── seeds/                        # Initial data
│       └── initialData.sql
│
├── docs/                            # Documentation
│   ├── README.md                    # Project overview
│   ├── API.md                       # API documentation
│   ├── PAYMENT_GATEWAY.md           # Payment setup guide
│   ├── SECURITY.md                  # Security implementation
│   └── SETUP.md                     # Installation guide
│
├── .gitignore                       # Git ignore file
└── README.md                        # This file
```

## 🛠️ Technologies Used

### Backend
- **Runtime**: Node.js
- **Framework**: Express.js
- **Database**: MySQL
- **Authentication**: JWT (JSON Web Tokens)
- **Password Hashing**: Bcrypt.js
- **Payment Gateways**: Stripe, PayPal
- **Security**: Helmet.js, CORS
- **Validation**: Express-validator
- **Encryption**: Node.js Crypto

### Frontend
- **Library**: React 18
- **Build Tool**: Vite
- **Routing**: React Router v6
- **HTTP Client**: Axios
- **Payment UI**: Stripe.js, React Stripe
- **Icons**: React Icons
- **Styling**: CSS3

## 📋 Prerequisites

- **Node.js** (v14 or higher)
- **npm** or **yarn**
- **MySQL** (v5.7 or higher)
- **Git**

## 🚀 Quick Start

### 1. Clone the Repository

```bash
git clone <repository-url>
cd "E-Commerce Platform with Secure Payment Gateway Integration"
```

### 2. Backend Setup

```bash
cd backend
npm install

# Create .env file
cp .env.example .env

# Start development server
npm run dev
# Server runs on http://localhost:5000
```

### 3. Frontend Setup

```bash
cd ../frontend
npm install

# Create .env file
cp .env.example .env

# Start development server
npm run dev
# App runs on http://localhost:3000
```

### 4. Database Setup

```bash
# Create database
mysql -u root -p
CREATE DATABASE ecommerce;
EXIT;

# Run migrations
mysql -u root -p ecommerce < ../database/migrations/001_create_users.sql
mysql -u root -p ecommerce < ../database/migrations/002_create_products.sql
mysql -u root -p ecommerce < ../database/migrations/003_create_orders.sql
mysql -u root -p ecommerce < ../database/migrations/004_create_payments.sql

# Seed data
mysql -u root -p ecommerce < ../database/seeds/initialData.sql
```

## 🔑 Configuration

### Backend (.env)

```env
# Server
PORT=5000
NODE_ENV=development

# Database
MONGODB_URI=mongodb://localhost:27017/ecommerce

# JWT
JWT_SECRET=your_super_secret_key_here
JWT_EXPIRE=7d

# Stripe
STRIPE_SECRET_KEY=your_stripe_secret_key
STRIPE_PUBLISHABLE_KEY=your_stripe_publishable_key

# PayPal
PAYPAL_MODE=sandbox
PAYPAL_CLIENT_ID=your_paypal_client_id
PAYPAL_CLIENT_SECRET=your_paypal_client_secret

# Frontend
CLIENT_URL=http://localhost:3000

# Encryption
ENCRYPTION_KEY=your_32_character_encryption_key
```

### Frontend (.env)

```env
VITE_API_URL=http://localhost:5000/api
VITE_STRIPE_PUBLISHABLE_KEY=your_stripe_publishable_key
VITE_PAYPAL_CLIENT_ID=your_paypal_client_id
```

## 📚 Documentation

- [API Documentation](./docs/API.md) - Complete API endpoint reference
- [Payment Gateway Setup](./docs/PAYMENT_GATEWAY.md) - Stripe and PayPal integration
- [Security Implementation](./docs/SECURITY.md) - Security features and best practices
- [Setup Guide](./docs/SETUP.md) - Detailed installation and deployment guide

## 🧪 Testing

### Backend Tests
```bash
cd backend
npm test
```

### Frontend Tests
```bash
cd frontend
npm test
```

### Manual Testing
- Use Stripe test card: `4242 4242 4242 4242`
- Use PayPal sandbox account

## 🚢 Deployment

### Frontend Build
```bash
cd frontend
npm run build
# Creates optimized build in `dist/` folder
```

### Production Checklist
- [ ] Set NODE_ENV to 'production'
- [ ] Enable HTTPS/TLS
- [ ] Configure all environment variables
- [ ] Setup database backups
- [ ] Enable monitoring and logging
- [ ] Configure payment gateway webhooks
- [ ] Setup error tracking (Sentry, etc.)
- [ ] Configure CDN for static assets
- [ ] Setup SSL certificates

## 🔐 Security Features

- **End-to-End Encryption**: AES-256 encryption for sensitive data
- **PCI DSS Compliance**: Secure payment processing
- **JWT Authentication**: Token-based authentication
- **Input Validation**: Comprehensive validation and sanitization
- **CORS Protection**: Cross-origin request security
- **Security Headers**: Helmet.js implementation
- **Password Hashing**: Bcrypt for secure storage

See [SECURITY.md](./docs/SECURITY.md) for detailed security implementation.

## 🐛 Troubleshooting

### Backend Issues
- **Port in use**: Change `PORT` in `.env`
- **Database connection error**: Verify MySQL is running and credentials are correct
- **Module not found**: Run `npm install` again

### Frontend Issues
- **API connection error**: Verify backend is running and `VITE_API_URL` is correct
- **Module not found**: Delete `node_modules` and `package-lock.json`, then run `npm install`

## 📝 API Endpoints

### Authentication
- `POST /api/auth/register` - Register user
- `POST /api/auth/login` - Login user
- `POST /api/auth/logout` - Logout user

### Products
- `GET /api/products` - Get all products
- `GET /api/products/:id` - Get product details
- `POST /api/products` - Create product (admin)
- `PUT /api/products/:id` - Update product (admin)
- `DELETE /api/products/:id` - Delete product (admin)

### Orders
- `GET /api/orders` - Get user orders
- `POST /api/orders` - Create order
- `GET /api/orders/:id` - Get order details

### Payments
- `POST /api/payments/stripe/create-payment-intent` - Create Stripe payment
- `POST /api/payments/paypal/create-payment` - Create PayPal payment
- `POST /api/payments/verify` - Verify payment status

See [API.md](./docs/API.md) for complete documentation.

## 🤝 Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 📄 License

This project is licensed under the ISC License - see the LICENSE file for details.

## 👨‍💻 Author

E-Commerce Platform Development Team

## 📞 Support

For support, email support@ecommerce.com or create an issue in the repository.

## 🙏 Acknowledgments

- Stripe for payment processing
- PayPal for payment services
- React and Node.js communities
- All contributors and supporters

---

**Last Updated**: June 2026

**Status**: ✅ Ready for Development
