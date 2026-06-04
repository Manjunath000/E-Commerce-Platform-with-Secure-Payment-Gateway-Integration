# 🚀 Complete Deployment Guide

## Step 1: Push Code to GitHub (Fix Permission Issue)

### Option A: Using GitHub CLI (Recommended)
```powershell
# Install GitHub CLI from https://cli.github.com/
# Then run:
gh auth login
# Follow the prompts to authenticate with your GitHub account

# Then push:
cd "c:\E-Commerce Platform with Secure Payment Gateway Integration"
git push -u origin main
```

### Option B: Using Personal Access Token
1. Go to https://github.com/settings/tokens
2. Click "Generate new token"
3. Select scopes: `repo` (full control of private repositories)
4. Copy the token
5. Run:
```powershell
git remote set-url origin https://<YOUR_GITHUB_USERNAME>:<YOUR_TOKEN>@github.com/Manjunath000/E-Commerce-Platform-with-Secure-Payment-Gateway-Integration.git
git push -u origin main
```

### Option C: Using SSH Keys
1. Generate SSH key: `ssh-keygen -t ed25519 -C "your_email@example.com"`
2. Add key to GitHub: https://github.com/settings/keys
3. Update remote:
```powershell
git remote set-url origin git@github.com:Manjunath000/E-Commerce-Platform-with-Secure-Payment-Gateway-Integration.git
git push -u origin main
```

---

## Step 2: Deploy to Railway (Easiest - Recommended ⭐)

### Prerequisites:
- GitHub repository pushed (complete Step 1)
- Railway account (free tier available): https://railway.app

### Deployment Steps:

1. **Go to Railway.app**
   - Sign in with GitHub
   - Click "New Project"
   - Select "Deploy from GitHub repo"

2. **Select Repository**
   - Choose "E-Commerce-Platform-with-Secure-Payment-Gateway-Integration"
   - Authorize Railway to access your repos

3. **Add Services**
   - Railway will automatically detect docker-compose.yml
   - It will create 3 services:
     - MySQL Database
     - Backend API (Express)
     - Frontend (React)

4. **Configure Environment Variables**

   **For Backend** (.env):
   ```
   NODE_ENV=production
   DB_HOST=${{MySQL.PGHOST}}
   DB_PORT=${{MySQL.PGPORT}}
   DB_USER=${{MySQL.PGUSER}}
   DB_PASSWORD=${{MySQL.PGPASSWORD}}
   DB_NAME=ecommerce_db
   
   JWT_SECRET=your-super-secret-jwt-key-change-this
   ENCRYPTION_KEY=32-character-encryption-key-here
   
   STRIPE_SECRET_KEY=sk_live_your_actual_stripe_key
   PAYPAL_CLIENT_ID=your_paypal_client_id
   PAYPAL_CLIENT_SECRET=your_paypal_secret
   
   CORS_ORIGIN=https://your-frontend-domain.railway.app
   NODE_PORT=5000
   ```

   **For Frontend** (.env):
   ```
   VITE_API_URL=https://your-backend-domain.railway.app/api
   VITE_STRIPE_PUBLIC_KEY=pk_live_your_stripe_public_key
   ```

5. **Deploy**
   - Click "Deploy"
   - Wait 3-5 minutes
   - Your app will be live at unique Railway URLs

6. **Test**
   - Visit provided frontend URL
   - Test API at `https://backend-url/api/products`
   - Test payment flows

---

## Step 3: Deploy to Render (Free Tier Alternative)

### Deployment Steps:

1. Go to https://render.com
2. Sign in with GitHub
3. Create new "Web Service"
4. Connect "E-Commerce-Platform-with-Secure-Payment-Gateway-Integration" repo
5. Build command: `npm install && npm run build`
6. Start command: `npm start`
7. Set environment variables (same as Railway step 4)
8. Deploy and get free domain

---

## Step 4: Deploy to DigitalOcean ($5/month)

### Deployment Steps:

1. Go to https://www.digitalocean.com/
2. Create App Platform app
3. Connect GitHub repository
4. Select docker-compose.yml for deployment
5. Configure environment
6. Set environment variables (same as Railway)
7. Deploy

**Includes:**
- Custom domain support
- SSL certificate
- 1GB RAM, 1vCPU
- Good for production

---

## Step 5: Deploy to AWS (Most Scalable)

### Services Needed:
- **RDS** - Managed MySQL database
- **ECS** - Container orchestration
- **EC2** - Backend server
- **CloudFront** - CDN for frontend
- **S3** - Static frontend hosting

### Steps:
1. Create AWS account
2. Set up RDS MySQL instance
3. Push Docker images to ECR (Elastic Container Registry)
4. Deploy backend to ECS
5. Deploy frontend to S3 + CloudFront
6. Configure environment variables

---

## Step 6: Production Checklist

Before going live, complete:

- [ ] Update payment gateway keys (Stripe/PayPal)
- [ ] Set strong `JWT_SECRET` and `ENCRYPTION_KEY`
- [ ] Enable HTTPS/SSL (done automatically on Railway/Render)
- [ ] Test all payment flows
- [ ] Test user authentication
- [ ] Test product browsing
- [ ] Test order creation
- [ ] Verify database backups
- [ ] Set up error monitoring (Sentry recommended)
- [ ] Set up uptime monitoring
- [ ] Configure custom domain (optional)
- [ ] Update CORS_ORIGIN in backend
- [ ] Test from different devices (mobile, desktop)

---

## Environment Variables Reference

### Backend Required Variables:
```
NODE_ENV=production
NODE_PORT=5000

# Database
DB_HOST=localhost
DB_PORT=3306
DB_USER=root
DB_PASSWORD=password
DB_NAME=ecommerce_db

# Security
JWT_SECRET=generate-strong-secret-here
ENCRYPTION_KEY=use-32-character-hex-key

# Payment Gateways
STRIPE_SECRET_KEY=sk_live_...
STRIPE_WEBHOOK_SECRET=whsec_...

PAYPAL_CLIENT_ID=AZ...
PAYPAL_CLIENT_SECRET=EJ...

# CORS
CORS_ORIGIN=https://your-frontend-domain.com
```

### Frontend Required Variables:
```
VITE_API_URL=https://your-backend-domain.com/api
VITE_STRIPE_PUBLIC_KEY=pk_live_...
```

---

## Accessing Your Application

After deployment you'll have URLs like:

```
Frontend: https://ecommerce-frontendXXXX.railway.app
Backend API: https://ecommerce-backendXXXX.railway.app
API Endpoint: https://ecommerce-backendXXXX.railway.app/api
```

### Direct Links Once Set Up:
- Product listing: `https://your-frontend-url/products`
- Cart: `https://your-frontend-url/cart`
- Checkout: `https://your-frontend-url/checkout`
- Payment: `https://your-frontend-url/payment`

---

## Troubleshooting

### Database Connection Failed
```
Error: "Cannot find module 'mysql2/promise'"
Solution: Ensure backend npm install completed, check DATABASE URL format
```

### Frontend Can't Connect to API
```
Error: "CORS error" or "Failed to fetch"
Solution: Update VITE_API_URL in frontend .env to match deployed backend URL
```

### Payment Gateway Not Working
```
Error: "Invalid API key"
Solution: Use LIVE keys (sk_live_, pk_live_), not test keys (sk_test_)
```

### Deployment Stuck
```
Solution: Check logs in Railway/Render dashboard for specific errors
Check .env variables are all set
Ensure Dockerfile builds successfully locally
```

---

## Next Steps

1. **Complete Step 1**: Push to GitHub using one of the authentication methods
2. **Choose Platform**: I recommend Railway for easiest setup
3. **Follow Platform Steps**: Complete the deployment for your chosen platform
4. **Test**: Verify all features work in production
5. **Configure Domain**: Optional - add custom domain (www.yourdomain.com)

**Estimated Time**: 15-30 minutes for complete deployment

---

## Need Help?

Check documentation in `docs/` folder:
- [GITHUB_DEPLOYMENT.md](docs/GITHUB_DEPLOYMENT.md) - GitHub CI/CD details
- [DEPLOYMENT_HOSTING.md](docs/DEPLOYMENT_HOSTING.md) - All hosting options
- [DOCKER_DEPLOYMENT.md](docs/DOCKER_DEPLOYMENT.md) - Docker-specific help
- [API.md](docs/API.md) - API endpoints reference
- [SECURITY.md](docs/SECURITY.md) - Security best practices

---

## Quick Stats

Your E-Commerce Platform includes:
- ✅ React 18 + Vite frontend (responsive design)
- ✅ Node.js + Express backend (REST API)
- ✅ MySQL database with 4 tables
- ✅ Stripe + PayPal payment integration
- ✅ JWT authentication
- ✅ Docker containerization
- ✅ GitHub Actions CI/CD
- ✅ Production-ready security

**Total Setup Time**: 15-30 minutes to live production deployment
