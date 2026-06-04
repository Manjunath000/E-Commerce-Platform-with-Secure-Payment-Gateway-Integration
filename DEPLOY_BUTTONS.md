# 🚀 One-Click Deployment

Click the buttons below to deploy your e-commerce platform!

---

## 🎯 Recommended: Deploy Frontend to Vercel + Backend on Railway

### Step 1: Deploy Frontend (Vercel)

[![Deploy with Vercel](https://vercel.com/button)](https://vercel.com/new/clone?repository-url=https://github.com/Manjunath000/E-Commerce-Platform-with-Secure-Payment-Gateway-Integration&project-name=ecommerce-frontend&root-directory=frontend&env=VITE_API_URL&envDescription=Backend%20API%20URL&envLink=https://github.com/Manjunath000/E-Commerce-Platform-with-Secure-Payment-Gateway-Integration)

**After clicking:**
1. Sign in with GitHub
2. It will auto-detect the frontend folder
3. Add this environment variable:
   ```
   VITE_API_URL=https://e-commerce-platform-with-secure-payment-gateway-production.up.railway.app/api
   ```
4. Click "Deploy"
5. Wait 2 minutes
6. **Get your frontend URL!** 🎉

---

### Step 2: Your Backend is Already on Railway ✅

Your backend API is already running at:
```
https://e-commerce-platform-with-secure-payment-gateway-production.up.railway.app
```

Just add this environment variable in Railway:
```
CLIENT_URL=https://your-vercel-url.vercel.app
```

---

## 🔧 Manual Deployment Steps

If buttons don't work, follow these simple steps:

### Deploy Frontend to Vercel (5 minutes):

1. **Go to:** https://vercel.com/new

2. **Import Git Repository:**
   - Paste: `https://github.com/Manjunath000/E-Commerce-Platform-with-Secure-Payment-Gateway-Integration`
   - Click "Import"

3. **Configure Project:**
   - **Project Name:** ecommerce-frontend
   - **Framework Preset:** Vite
   - **Root Directory:** Click "Edit" → Select `frontend` folder
   - **Build Command:** `npm run build`
   - **Output Directory:** `dist`

4. **Environment Variables:**
   Click "Add" and enter:
   ```
   Name: VITE_API_URL
   Value: https://e-commerce-platform-with-secure-payment-gateway-production.up.railway.app/api
   ```

5. **Click "Deploy"**

6. **Wait 2-3 minutes**

7. **Copy your URL:** `https://ecommerce-frontend-xxxx.vercel.app`

8. **Update Railway Backend:**
   - Go to Railway dashboard
   - Click on your backend service
   - Variables tab
   - Add:
     ```
     CLIENT_URL=https://ecommerce-frontend-xxxx.vercel.app
     ```

---

## 🎉 That's It!

After deployment:
- ✅ **Frontend:** `https://your-project.vercel.app`
- ✅ **Backend API:** `https://e-commerce-platform-with-secure-payment-gateway-production.up.railway.app`
- ✅ **Database:** Already on Railway

**Share your frontend URL with anyone!**

---

## 🧪 Test Your Deployment

Visit these URLs to test:

1. **Frontend Homepage:**
   ```
   https://your-vercel-url.vercel.app
   ```

2. **Backend Health Check:**
   ```
   https://e-commerce-platform-with-secure-payment-gateway-production.up.railway.app/health
   ```

3. **API Test:**
   ```
   https://e-commerce-platform-with-secure-payment-gateway-production.up.railway.app/api/products
   ```

---

## 🔧 Troubleshooting

### Frontend shows blank page:
- Check environment variables in Vercel
- Make sure `VITE_API_URL` is set correctly
- Check browser console (F12) for errors

### CORS errors:
- Make sure `CLIENT_URL` is set in Railway backend
- Check it matches your Vercel URL exactly (no trailing slash)

### API not working:
- Check Railway logs
- Verify database migrations ran
- Check environment variables

---

## 💡 Pro Tips

### Auto-deploy on Git Push:
Both Vercel and Railway auto-deploy when you push to GitHub!

```bash
git add .
git commit -m "update features"
git push origin main
```

Within 2 minutes, both frontend and backend will update automatically! 🎉

### Custom Domain:
1. Buy domain ($10-15/year)
2. Add in Vercel: Settings → Domains
3. Update DNS records
4. Done! Your site at `yourdomain.com`

---

## 📊 What You'll Have

| Service | Platform | URL | Cost |
|---------|----------|-----|------|
| Frontend | Vercel | `https://....vercel.app` | FREE |
| Backend | Railway | `https://....railway.app` | $10-35/mo |
| Database | Railway | Internal | Included |

**Total: ~$10-35/month** (Railway's free trial covers first month!)

---

## 🎯 Next Steps After Deployment

1. ✅ Test all features
2. ✅ Add products to database
3. ✅ Set up payment keys (Stripe/PayPal)
4. ✅ Customize branding
5. ✅ Share your URL!

---

## 🆘 Need Help?

If you get stuck:
1. Check deployment logs (Vercel/Railway dashboard)
2. Verify all environment variables
3. Test backend API directly
4. Check browser console for errors

---

**Ready?** Click the Vercel button at the top or follow the manual steps! 🚀
