# ⚙️ ENVIRONMENT VARIABLES - COPY & PASTE THESE

## 📝 STEP 1: COPY THESE FOR VERCEL (Frontend)

When you deploy to Vercel, add these environment variables:

```
Name: VITE_API_URL
Value: https://your-backend-railway.railway.app/api

Name: VITE_STRIPE_PUBLIC_KEY
Value: pk_live_YOUR_STRIPE_KEY_HERE
```

---

## 📝 STEP 2: COPY THESE FOR RAILWAY (Backend)

When you deploy to Railway, add these variables:

```
NODE_ENV=production

NODE_PORT=5000

DB_HOST=your-planetscale-host

DB_PORT=3306

DB_USER=your-planetscale-user

DB_PASSWORD=your-planetscale-password

DB_NAME=ecommerce_db

JWT_SECRET=use-a-random-32-character-secret-key-change-this-string

ENCRYPTION_KEY=a1b2c3d4e5f6g7h8i9j0k1l2m3n4o5p6q7r8s9t0

STRIPE_SECRET_KEY=sk_live_YOUR_STRIPE_KEY_HERE

PAYPAL_CLIENT_ID=your_paypal_client_id

PAYPAL_CLIENT_SECRET=your_paypal_client_secret

CORS_ORIGIN=https://your-vercel-domain.vercel.app
```

---

## 🔑 WHAT YOU NEED TO REPLACE

| Variable | Where to Get It | Timeline |
|----------|-----------------|----------|
| `DB_HOST` | PlanetScale (after creating DB) | After Step 3 |
| `DB_USER` | PlanetScale (after creating DB) | After Step 3 |
| `DB_PASSWORD` | PlanetScale (after creating DB) | After Step 3 |
| `JWT_SECRET` | Generate yourself (random string) | Now |
| `ENCRYPTION_KEY` | Generate yourself (hex string) | Now |
| `STRIPE_SECRET_KEY` | Stripe Dashboard after signup | After Step 4 |
| `STRIPE_PUBLIC_KEY` | Stripe Dashboard after signup | After Step 4 |
| `CORS_ORIGIN` | Your Vercel URL after deploy | After Step 1 |

---

## 🎯 QUICK DEPLOYMENT GUIDE

This file is meant to be used with: **DEPLOY_IN_15_MINUTES.md**

Follow that guide and copy these variables when prompted!
