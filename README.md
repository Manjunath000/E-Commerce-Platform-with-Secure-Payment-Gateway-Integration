# 🛍️ E-Commerce Platform with Secure Payment Gateway Integration

[![CI/CD Pipeline](https://github.com/Manjunath000/E-Commerce-Platform-with-Secure-Payment-Gateway-Integration/workflows/CI%2FCD%20Pipeline/badge.svg)](https://github.com/Manjunath000/E-Commerce-Platform-with-Secure-Payment-Gateway-Integration/actions)
[![License](https://img.shields.io/badge/license-ISC-blue.svg)](./LICENSE)
[![Node](https://img.shields.io/badge/node-%3E%3D18.0.0-brightgreen)](https://nodejs.org)
[![Docker](https://img.shields.io/badge/docker-ready-blue)](./docs/DOCKER_DEPLOYMENT.md)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg)](./CONTRIBUTING.md)

> A modern, full-stack e-commerce platform with secure payment processing, built with React, Node.js, Express, and MySQL. Features Docker containerization, CI/CD pipeline, and production-ready security.

![Hero Banner](https://via.placeholder.com/1200x400/667eea/ffffff?text=E-Commerce+Platform)

---

## ✨ Features

### 🎨 Frontend
- ⚡ **React 18** with Vite for lightning-fast development
- 🎯 **Modern UI/UX** with responsive design and animations
- 🌈 **Visual Graphics** with gradient backgrounds and animated components
- 📱 **Mobile-First** responsive design
- ♿ **Accessible** WCAG compliant components
- 🌗 **Dark Mode** support via prefers-color-scheme

### 🔧 Backend
- 🚀 **Node.js & Express** RESTful API
- 🗄️ **MySQL** database with connection pooling
- 🔐 **JWT Authentication** with bcrypt password hashing
- 💳 **Payment Integration** (Stripe & PayPal)
- 🛡️ **Security** with Helmet.js, CORS, input validation
- 📝 **Request Logging** and error handling

### 🐳 DevOps
- 🐳 **Docker** containerization with multi-stage builds
- 🎼 **Docker Compose** for local development
- 🔄 **CI/CD Pipeline** with GitHub Actions
- 🔍 **Security Scanning** with Trivy
- 📊 **Health Checks** for all services
- 🔧 **phpMyAdmin** for database management

### 🔒 Security
- 🔐 Password hashing with bcrypt
- 🎫 JWT token-based authentication
- 🔒 AES-256 encryption for sensitive data
- 🛡️ Security headers with Helmet.js
- 🚫 CORS protection
- ✅ Input validation with express-validator
- 🔄 Prepared statements (SQL injection prevention)

---

## 🚨 Important Security Notice

**⚠️ CRITICAL**: This repository recently had a security issue that has been fixed. If you're upgrading from version 1.0.0, please read [SECURITY_WARNING.md](./SECURITY_WARNING.md) immediately.

---

## 🚀 Quick Start

### Prerequisites
- Node.js 18+ ([Download](https://nodejs.org/))
- Docker & Docker Compose ([Download](https://www.docker.com/))
- Git ([Download](https://git-scm.com/))

### One-Command Setup

```bash
# Clone the repository
git clone https://github.com/Manjunath000/E-Commerce-Platform-with-Secure-Payment-Gateway-Integration.git
cd "E-Commerce Platform with Secure Payment Gateway Integration"

# Start everything with Docker
docker-compose up -d

# Wait 30 seconds for services to initialize, then open:
# 🌐 Frontend: http://localhost:3000
# 🔧 Backend API: http://localhost:5000
# 📊 phpMyAdmin: http://localhost:8080
```

That's it! 🎉

---

## 📖 Documentation

| Document | Description |
|----------|-------------|
| **[QUICK_START.md](./QUICK_START.md)** | Get started in 5 minutes |
| **[SECURITY_WARNING.md](./SECURITY_WARNING.md)** | 🔴 Critical security information |
| **[CHANGELOG.md](./CHANGELOG.md)** | Version history and changes |
| **[PRE_DEPLOYMENT_CHECKLIST.md](./PRE_DEPLOYMENT_CHECKLIST.md)** | Production readiness checklist |
| **[docs/SETUP.md](./docs/SETUP.md)** | Detailed installation guide |
| **[docs/DOCKER_DEPLOYMENT.md](./docs/DOCKER_DEPLOYMENT.md)** | Docker deployment guide |
| **[docs/GITHUB_DEPLOYMENT.md](./docs/GITHUB_DEPLOYMENT.md)** | GitHub & hosting guide |
| **[docs/API.md](./docs/API.md)** | API endpoints reference |
| **[docs/SECURITY.md](./docs/SECURITY.md)** | Security best practices |
| **[docs/PAYMENT_GATEWAY.md](./docs/PAYMENT_GATEWAY.md)** | Payment setup guide |

---

## 🏗️ Project Structure

```
ecommerce-platform/
├── backend/                 # Node.js Express API
│   ├── config/             # Configuration files
│   │   ├── database.js     # MySQL connection pool
│   │   └── paymentGateway.js
│   ├── controllers/        # Route controllers
│   ├── middleware/         # Custom middleware
│   ├── models/             # Database models
│   │   ├── User.js         # ✅ NEW
│   │   ├── Product.js      # ✅ NEW
│   │   ├── Order.js        # ✅ NEW
│   │   └── Payment.js      # ✅ NEW
│   ├── routes/             # API routes
│   ├── utils/              # Utility functions
│   ├── Dockerfile          # ✅ NEW
│   └── server.js           # Entry point
├── frontend/               # React application
│   ├── src/
│   │   ├── components/     # React components
│   │   │   ├── Hero.jsx    # ✅ NEW - Animated hero section
│   │   │   ├── Header.jsx
│   │   │   ├── Footer.jsx
│   │   │   └── ...
│   │   ├── styles/         # CSS files
│   │   │   ├── global.css  # ✅ NEW - Modern design system
│   │   │   └── hero.css    # ✅ NEW - Hero animations
│   │   ├── pages/          # Page components
│   │   ├── contexts/       # React contexts
│   │   └── hooks/          # Custom hooks
│   ├── Dockerfile          # ✅ NEW
│   ├── nginx.conf          # ✅ NEW
│   └── package.json
├── database/               # SQL migrations & seeds
│   ├── migrations/
│   │   ├── 001_create_users.sql
│   │   ├── 002_create_products.sql
│   │   ├── 003_create_orders.sql
│   │   ├── 004_create_payments.sql
│   │   └── 005_create_order_items.sql  # ✅ NEW
│   └── seeds/
│       └── initialData.sql
├── docs/                   # Documentation
├── .github/
│   └── workflows/
│       └── ci-cd.yml       # ✅ NEW - CI/CD pipeline
├── docker-compose.yml      # ✅ NEW - Multi-container setup
├── .dockerignore           # ✅ NEW
├── .gitignore
├── SECURITY_WARNING.md     # ✅ NEW - Security guide
├── CHANGELOG.md            # ✅ NEW - Version history
└── README.md               # This file
```

---

## 💻 Development

### Local Development (without Docker)

#### Backend
```bash
cd backend
npm install
npm run dev  # Starts on port 5000
```

#### Frontend
```bash
cd frontend
npm install
npm run dev  # Starts on port 3000
```

#### Database
Install MySQL locally and run migrations from `database/migrations/`

### Environment Variables

Copy `.env.example` to `.env` and configure:

```env
# Backend
DB_HOST=localhost
DB_USER=ecommerce
DB_PASSWORD=ecommerce123
DB_NAME=ecommerce
JWT_SECRET=your_super_secret_key_minimum_32_chars
STRIPE_SECRET_KEY=sk_test_...
PAYPAL_CLIENT_ID=...

# Frontend
VITE_API_URL=http://localhost:5000/api
VITE_STRIPE_PUBLISHABLE_KEY=pk_test_...
```

---

## 🧪 Testing

```bash
# Backend tests
cd backend
npm test

# Frontend tests
cd frontend
npm test

# E2E tests (coming soon)
npm run test:e2e
```

---

## 🐳 Docker Commands

```bash
# Start all services
docker-compose up -d

# View logs
docker-compose logs -f

# Stop all services
docker-compose down

# Rebuild and restart
docker-compose up --build -d

# Access MySQL
docker-compose exec mysql mysql -u ecommerce -pecommerce123 ecommerce

# Run migrations
docker-compose exec -T mysql mysql -u ecommerce -pecommerce123 ecommerce < database/migrations/001_create_users.sql
```

---

## 🚀 Deployment

### Railway (Recommended - Easiest)

1. Sign up at [railway.app](https://railway.app)
2. Click "Deploy from GitHub"
3. Select this repository
4. Add environment variables
5. Deploy! 🎉

**Cost**: $5-20/month

### DigitalOcean

```bash
# Create droplet with Docker
# SSH into server
ssh root@your_server_ip

# Clone and deploy
git clone [your-repo-url]
cd ecommerce-platform
docker-compose up -d
```

**Cost**: $5+/month

See [docs/DEPLOYMENT_HOSTING.md](./docs/DEPLOYMENT_HOSTING.md) for more options.

---

## 🔧 Configuration

### Payment Gateways

#### Stripe
1. Sign up at [stripe.com](https://stripe.com)
2. Get API keys from Dashboard → Developers → API keys
3. Add to `.env`:
   ```env
   STRIPE_SECRET_KEY=sk_test_...
   STRIPE_PUBLISHABLE_KEY=pk_test_...
   ```

#### PayPal
1. Sign up at [developer.paypal.com](https://developer.paypal.com)
2. Create sandbox app
3. Get Client ID and Secret
4. Add to `.env`:
   ```env
   PAYPAL_CLIENT_ID=...
   PAYPAL_CLIENT_SECRET=...
   ```

---

## 📊 API Endpoints

### Authentication
- `POST /api/auth/register` - Register new user
- `POST /api/auth/login` - Login user
- `GET /api/auth/me` - Get current user

### Products
- `GET /api/products` - List products
- `GET /api/products/:id` - Get product details
- `POST /api/products` - Create product (admin)
- `PUT /api/products/:id` - Update product (admin)
- `DELETE /api/products/:id` - Delete product (admin)

### Orders
- `GET /api/orders` - List user orders
- `GET /api/orders/:id` - Get order details
- `POST /api/orders` - Create order
- `PUT /api/orders/:id` - Update order status (admin)

### Payments
- `POST /api/payments/stripe` - Process Stripe payment
- `POST /api/payments/paypal` - Process PayPal payment
- `GET /api/payments/:id` - Get payment details

Full API documentation: [docs/API.md](./docs/API.md)

---

## 🤝 Contributing

Contributions are welcome! Please read our [Contributing Guide](./CONTRIBUTING.md) first.

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'feat: add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

---

## 📝 License

This project is licensed under the ISC License - see the [LICENSE](./LICENSE) file for details.

---

## 🙏 Acknowledgments

- Built with [React](https://react.dev/), [Node.js](https://nodejs.org/), [Express](https://expressjs.com/)
- Payment processing by [Stripe](https://stripe.com/) & [PayPal](https://paypal.com/)
- Containerization with [Docker](https://docker.com/)
- CI/CD with [GitHub Actions](https://github.com/features/actions)

---

## 📞 Support

- 📖 **Documentation**: See `/docs` folder
- 🐛 **Bug Reports**: [Open an issue](https://github.com/Manjunath000/E-Commerce-Platform-with-Secure-Payment-Gateway-Integration/issues)
- 💬 **Questions**: [GitHub Discussions](https://github.com/Manjunath000/E-Commerce-Platform-with-Secure-Payment-Gateway-Integration/discussions)

---

## 🗺️ Roadmap

- [ ] User profile page
- [ ] Product reviews
- [ ] Wishlist
- [ ] Order tracking
- [ ] Email notifications
- [ ] Admin dashboard
- [ ] Analytics
- [ ] Multi-language support

---

## ⭐ Star History

If you find this project useful, please consider giving it a star! ⭐

---

**Made with ❤️ by the E-Commerce Platform Team**

**Last Updated**: ${new Date().toISOString().split('T')[0]}
**Version**: 2.0.0
**Status**: ✅ Production Ready
