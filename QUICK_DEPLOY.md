# 🚀 ONE-CLICK DEPLOYMENT GUIDE

## DEPLOY YOUR APP IN 5 STEPS (30 minutes total)

---

## ⚠️ CRITICAL - STEP 0: GitHub Authentication

**Your code won't deploy without pushing to GitHub first!**

### Quick Fix - Run This Script:
```powershell
# Navigate to project directory
cd "c:\E-Commerce Platform with Secure Payment Gateway Integration"

# Run the authentication helper
.\GITHUB_PUSH.ps1
```

This will:
1. Ask for your GitHub Personal Access Token
2. Configure git with your credentials
3. Push your code to GitHub
4. Verify the push succeeded

**Without this step, deployment WILL FAIL!**

---

## STEP 1: Deploy Frontend to Vercel ✈️

**Time: 5 minutes | Free Tier: ✓ Yes**

### Click These Links in Order:

#### 1a. Create Vercel Account
→ **https://vercel.com/signup**
- Sign in with GitHub (easier)
- Authorize Vercel to access repos

#### 1b. Import Your Repository
→ **https://vercel.com/new**
- Search for: "E-Commerce-Platform-with-Secure-Payment-Gateway-Integration"
- Click "Import"

#### 1c. Configure Build Settings
On the "Import Project" page:

**Framework**: Select "Vite"
**Build Command**: `npm run build`
**Output Directory**: `dist`

#### 1d. Add Environment Variables
Click "Environment Variables" and add:
```
VITE_API_URL = https://your-backend-url.onrender.com/api
VITE_STRIPE_PUBLIC_KEY = pk_live_YOUR_KEY_HERE
```

**Note**: Use your Railway backend URL from Step 2!

#### 1e. Deploy
Click "Deploy" button
Wait 2-3 minutes...

### ✅ Result:
Your frontend URL: **https://your-project-name.vercel.app**

---

## STEP 2: Deploy Backend to Railway 🚂

**Time: 5 minutes | Free Tier: ✓ Yes (limited)**

### Click These Links in Order:

#### 2a. Create Railway Account
→ **https://railway.app/login**
- Sign up with GitHub
- Authorize Railway

#### 2b. Create New Project
→ **https://railway.app/dashboard**
- Click "Create New Project"
- Select "Deploy from GitHub repo"

#### 2c. Select Your Repository
- Search: "E-Commerce-Platform-with-Secure-Payment-Gateway-Integration"
- Click to select it
- Authorize Railway to access GitHub

#### 2d. Add All Environment Variables
Click "Add Service" → "Variables"

Copy-paste all these (update with your actual values):

```
NODE_ENV=production
NODE_PORT=5000

DB_HOST=your-mysql-host-here
DB_PORT=3306
DB_USER=your-db-user
DB_PASSWORD=your-db-password
DB_NAME=ecommerce_db

JWT_SECRET=use-min-32-characters-secret-key-here-e8d7f9k3k8d3k8d3
ENCRYPTION_KEY=32character-hex-key-here-a1b2c3d4e5f6g7h8i9j0k1l2m3n4o5p6

STRIPE_SECRET_KEY=sk_live_your_actual_stripe_key_here
PAYPAL_CLIENT_ID=your_paypal_client_id_here
PAYPAL_CLIENT_SECRET=your_paypal_client_secret_here

CORS_ORIGIN=https://your-vercel-frontend-url.vercel.app
```

#### 2e. Deploy
Click "Deploy" button
Wait 3-5 minutes...

### ✅ Result:
Your backend URL: **https://your-railway-backend.onrender.com**
API endpoint: **https://your-railway-backend.onrender.com/api**

---

## STEP 3: Create Cloud Database 🗄️

**Time: 5 minutes | Free Tier: ✓ Yes**

### OPTION A: Railway MySQL (Easiest)

1. Go to **https://railway.app/dashboard**
2. Click "New Service"
3. Select "MySQL"
4. Click "Add"
5. Railway will create a MySQL database automatically
6. Go to "Variables" tab
7. Copy these values:
   - `DB_HOST`
   - `DB_PORT`
   - `DB_USER`
   - `DB_PASSWORD`

8. Add to your Railway Backend service variables (Step 2d above)

### OPTION B: PlanetScale (More Storage)

1. Go to **https://planetscale.com/sign-up**
2. Sign up (free forever)
3. Create new database
4. Click "Passwords"
5. Create password
6. Copy connection details
7. Add to Railway Backend variables

### OPTION C: Aiven (Free Trial)

1. Go to **https://aiven.io**
2. Sign up
3. Create MySQL service
4. Copy connection credentials
5. Add to Railway Backend variables

### ✅ Result:
Your database is now cloud-hosted and secured!

---

## STEP 4: Configure Payment Gateway 💳

**Time: 5 minutes | Free Tier: ✓ Yes**

### OPTION A: Stripe (Recommended)

1. Go to **https://stripe.com/en-in/register**
2. Create account
3. Verify your email
4. Go to **Dashboard** → **API Keys**
5. Copy these:
   - `Publishable Key` (starts with `pk_live_`)
   - `Secret Key` (starts with `sk_live_`)

6. Add to:
   - **Vercel** (Step 1d): `VITE_STRIPE_PUBLIC_KEY`
   - **Railway** (Step 2d): `STRIPE_SECRET_KEY`

### OPTION B: PayPal (Already Integrated)

1. Go to **https://developer.sandbox.paypal.com**
2. Create account
3. Go to **Apps & Credentials**
4. Copy Client ID and Secret
5. Add to Railway:
   - `PAYPAL_CLIENT_ID`
   - `PAYPAL_CLIENT_SECRET`

### OPTION C: Razorpay

1. Go to **https://razorpay.com**
2. Create account
3. Verify account
4. Go to **Settings** → **API Keys**
5. Copy Key ID and Secret
6. Add to Railway variables

### ✅ Result:
Your payment gateway is ready for live transactions!

---

## STEP 5: Test Everything Works 🧪

**Time: 5 minutes**

1. Open your Vercel frontend URL: **https://your-project.vercel.app**
2. You should see the home page with products
3. Try these features:
   - ✓ Browse products
   - ✓ Click on a product
   - ✓ Add to cart
   - ✓ Go to checkout
   - ✓ See payment form (Stripe/PayPal)
4. Check backend API:
   - Open browser tab: **https://your-backend.onrender.com/api/products**
   - You should see JSON with products

### ✅ Result:
Your full stack application is live and working!

---

## FINAL RESULT 🎉

### What You Have Now:

```
✓ FRONTEND
  https://your-project.vercel.app
  → Accessible from anywhere
  → Fast CDN delivery
  → Auto-deploys from GitHub

✓ BACKEND API
  https://your-backend.onrender.com/api
  → All endpoints live
  → Connected to database
  → Payment processing enabled

✓ DATABASE
  Cloud-hosted MySQL
  → Secure
  → Backed up
  → Scalable

✓ PAYMENT GATEWAY
  Stripe / PayPal / Razorpay
  → Live transactions
  → Secure processing
  → Real payments

✓ SECURITY
  ✓ HTTPS everywhere
  ✓ JWT authentication
  ✓ AES-256 encryption
  ✓ CORS protection
```

---

## 🔥 QUICK LINKS (BOOKMARKS THESE!)

### Deployment Platforms:
- **Vercel**: https://vercel.com/dashboard
- **Railway**: https://railway.app/dashboard
- **PlanetScale**: https://app.planetscale.com

### Payment Gateways:
- **Stripe**: https://dashboard.stripe.com
- **PayPal Developer**: https://developer.sandbox.paypal.com
- **Razorpay**: https://merchant.razorpay.com

### GitHub:
- **Your Repo**: https://github.com/Manjunath000/E-Commerce-Platform-with-Secure-Payment-Gateway-Integration

---

## 📋 TROUBLESHOOTING

### Frontend Won't Connect to Backend
**Error**: "CORS error" or "failed to fetch"
**Fix**: 
- Check `CORS_ORIGIN` in Railway matches your Vercel URL
- Redeploy Railway backend after changing CORS_ORIGIN
- Wait 2-3 minutes for changes to take effect

### Backend Deployment Failed
**Error**: "Build failed"
**Fix**:
- Check all environment variables are set
- Verify DATABASE URL is correct
- Check JWT_SECRET is 32+ characters
- Review logs in Railway dashboard

### Payment Gateway Not Working
**Error**: "Invalid API key"
**Fix**:
- Use **LIVE** keys (pk_live_, sk_live_)
- Don't use TEST keys (pk_test_, sk_test_)
- Verify key is copied completely (no extra spaces)
- Redeploy after changing keys

### Database Connection Timeout
**Error**: "Connection refused"
**Fix**:
- Verify DB_HOST is correct
- Check DB_PORT (usually 3306)
- Verify username and password
- Ensure database is running in your hosting platform

---

## ⏱️ DEPLOYMENT TIMELINE

```
Step 0: GitHub Auth        → 3 min
Step 1: Vercel Frontend    → 5 min
Step 2: Railway Backend    → 5 min
Step 3: Cloud Database     → 5 min
Step 4: Payment Gateway    → 5 min
Step 5: Testing            → 5 min
        ──────────────
TOTAL:                       28 minutes
```

---

## 🎯 NEXT: Run These Commands

```powershell
# Open PowerShell in project directory
cd "c:\E-Commerce Platform with Secure Payment Gateway Integration"

# Step 1: Push code to GitHub
.\GITHUB_PUSH.ps1

# Then manually follow steps 1-5 above using the provided links
```

---

## 💡 PRO TIPS

1. **Save Your URLs** - Bookmark these once deployed:
   - Frontend URL
   - Backend API URL
   - Railway dashboard
   - Vercel dashboard

2. **Keep Credentials Safe** - Never commit .env files:
   - Use environment variables in platforms
   - Never share tokens/secrets publicly

3. **Monitor Logs** - Set up monitoring:
   - Railway: Check logs when issues occur
   - Vercel: Same
   - Check backend API for errors

4. **Custom Domain** (Optional later):
   - Buy domain from GoDaddy/Namecheap (~$1-10/year)
   - Connect to Vercel and Railway
   - Update CORS_ORIGIN to new domain

---

## 🆘 NEED HELP?

Check these documentation files:
- **DEPLOYMENT_GUIDE.md** - Detailed deployment steps
- **docs/API.md** - All API endpoints
- **docs/SECURITY.md** - Security details
- **QUICK_START.md** - Local development

---

**Questions? All documentation is in the `docs/` folder!** 📚

**Ready to deploy?** Start with `.\GITHUB_PUSH.ps1` → Then follow Steps 1-5 above! 🚀
