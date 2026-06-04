# Complete Setup Guide

## Prerequisites

- Node.js (v14 or higher)
- npm or yarn
- MySQL (v5.7 or higher)
- Git

## Step 1: Clone Repository

```bash
git clone <repository-url>
cd "E-Commerce Platform with Secure Payment Gateway Integration"
```

## Step 2: Backend Setup

### 2.1 Install Dependencies

```bash
cd backend
npm install
```

### 2.2 Environment Configuration

```bash
cp .env.example .env
```

Edit `.env` with your configuration:
```
MONGODB_URI=mongodb://localhost:27017/ecommerce
PORT=5000
JWT_SECRET=your_secret_key_here
STRIPE_SECRET_KEY=your_stripe_secret
PAYPAL_CLIENT_ID=your_paypal_client_id
```

### 2.3 Database Setup (MySQL)

Create database:
```bash
mysql -u root -p
CREATE DATABASE ecommerce;
```

Run migrations:
```bash
mysql -u root -p ecommerce < ../database/migrations/001_create_users.sql
mysql -u root -p ecommerce < ../database/migrations/002_create_products.sql
mysql -u root -p ecommerce < ../database/migrations/003_create_orders.sql
mysql -u root -p ecommerce < ../database/migrations/004_create_payments.sql
```

Seed initial data:
```bash
mysql -u root -p ecommerce < ../database/seeds/initialData.sql
```

### 2.4 Start Backend Server

```bash
npm run dev
# Server runs on http://localhost:5000
```

## Step 3: Frontend Setup

### 3.1 Install Dependencies

```bash
cd ../frontend
npm install
```

### 3.2 Environment Configuration

```bash
cp .env.example .env
```

Edit `.env`:
```
VITE_API_URL=http://localhost:5000/api
VITE_STRIPE_PUBLISHABLE_KEY=your_stripe_publishable_key
VITE_PAYPAL_CLIENT_ID=your_paypal_client_id
```

### 3.3 Start Development Server

```bash
npm run dev
# Application runs on http://localhost:3000
```

## Step 4: Payment Gateway Setup

### Stripe Setup

1. Create account at https://stripe.com
2. Get API keys from Dashboard
3. Add to backend `.env`:
   ```
   STRIPE_SECRET_KEY=sk_test_...
   STRIPE_PUBLISHABLE_KEY=pk_test_...
   ```

### PayPal Setup

1. Create account at https://developer.paypal.com
2. Create an app to get credentials
3. Add to backend `.env`:
   ```
   PAYPAL_CLIENT_ID=...
   PAYPAL_CLIENT_SECRET=...
   PAYPAL_MODE=sandbox
   ```

## Step 5: Testing

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

### Manual Testing with Stripe

Use test card: `4242 4242 4242 4242`

## Step 6: Production Deployment

### Build Frontend

```bash
cd frontend
npm run build
```

This creates `dist/` folder for deployment.

### Deploy Backend

1. Set production environment variables
2. Use process manager (PM2, Forever)
3. Setup reverse proxy (Nginx)
4. Configure SSL certificates

### Database Migration for Production

```bash
# Create backup
mysqldump -u root -p ecommerce > backup.sql

# Run migrations
mysql -u root -p ecommerce < migrations/latest.sql
```

## Troubleshooting

### Backend Issues

**Port already in use**:
```bash
# Change PORT in .env
PORT=5001
```

**Database connection error**:
- Check MySQL is running
- Verify credentials in `.env`
- Check database exists

### Frontend Issues

**API Connection error**:
- Verify backend is running
- Check VITE_API_URL in `.env`
- Check CORS configuration

**Module not found**:
```bash
rm -rf node_modules package-lock.json
npm install
```

## Performance Optimization

1. Enable gzip compression
2. Implement caching strategies
3. Optimize image sizes
4. Use CDN for static assets
5. Database query optimization

## Security Checklist

- [ ] All secrets in environment variables
- [ ] HTTPS enabled
- [ ] Helmet.js configured
- [ ] CORS properly configured
- [ ] Input validation implemented
- [ ] Database credentials secured
- [ ] API keys rotated regularly

## Next Steps

1. Review [API.md](./API.md) for API documentation
2. Review [PAYMENT_GATEWAY.md](./PAYMENT_GATEWAY.md) for payment setup
3. Review [SECURITY.md](./SECURITY.md) for security implementation
4. Setup CI/CD pipeline
5. Configure monitoring and logging

## Support

For issues or questions, refer to:
- Backend: See `backend/README.md`
- Frontend: See `frontend/README.md`
- Documentation: See `docs/` folder
