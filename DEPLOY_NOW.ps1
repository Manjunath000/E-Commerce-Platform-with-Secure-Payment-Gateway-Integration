# ============================================
# E-Commerce Platform - Automated Deployment
# ============================================
# This script will help you deploy your app to:
# - Frontend → Vercel
# - Backend → Railway  
# - Database → Railway/PlanetScale
# ============================================

Write-Host "╔════════════════════════════════════════════════════════════╗" -ForegroundColor Cyan
Write-Host "║  E-Commerce Platform - Automated Deployment Script         ║" -ForegroundColor Cyan
Write-Host "╚════════════════════════════════════════════════════════════╝" -ForegroundColor Cyan
Write-Host ""

# Step 1: GitHub Authentication
Write-Host "STEP 1: GitHub Authentication & Push" -ForegroundColor Yellow
Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor Yellow

Write-Host ""
Write-Host "Important: You need to authenticate with GitHub." -ForegroundColor Magenta
Write-Host ""
Write-Host "Using GitHub CLI for secure authentication..."
Write-Host ""

# Try to use GitHub CLI
$ghPath = "C:\Program Files\GitHub CLI\gh.exe"
if (Test-Path $ghPath) {
    Write-Host "✓ GitHub CLI found at: $ghPath" -ForegroundColor Green
    Write-Host ""
    Write-Host "Authenticating with GitHub..." -ForegroundColor Cyan
    Write-Host "A browser window will open. Please:"
    Write-Host "  1. Click 'Authorize github'"
    Write-Host "  2. Enter your authorization code when prompted"
    Write-Host "  3. Complete authentication"
    Write-Host ""
    
    # Start GitHub CLI auth
    & $ghPath auth login
} else {
    Write-Host "⚠ GitHub CLI not in expected path" -ForegroundColor Yellow
    Write-Host ""
    Write-Host "OPTION A: Use Personal Access Token (Recommended)" -ForegroundColor Cyan
    Write-Host "  1. Go to: https://github.com/settings/tokens"
    Write-Host "  2. Click 'Generate new token (classic)'"
    Write-Host "  3. Select scopes: repo, read:user, write:repo_hook"
    Write-Host "  4. Copy the token (you won't see it again!)"
    Write-Host "  5. Paste it here when prompted:"
    Write-Host ""
    
    # Ask user to input token
    $token = Read-Host "Enter your GitHub Personal Access Token"
    
    if ($token) {
        Write-Host "✓ Token saved" -ForegroundColor Green
        
        # Configure git with token
        $githubUser = Read-Host "Enter your GitHub username"
        git config --global user.name $githubUser
        git config --global user.email "$githubUser@github.com"
        
        # Reset remote with token
        $repoOwner = Read-Host "Enter repository owner (e.g., Manjunath000)"
        $repoName = "E-Commerce-Platform-with-Secure-Payment-Gateway-Integration"
        
        # Remove old remote
        git remote remove origin
        
        # Add new remote with token
        $remoteUrl = "https://${githubUser}:${token}@github.com/${githubUser}/${repoName}.git"
        git remote add origin $remoteUrl
        
        Write-Host ""
        Write-Host "Pushing code to GitHub..." -ForegroundColor Cyan
        git push -u origin main
        
        if ($LASTEXITCODE -eq 0) {
            Write-Host "✓ Code pushed successfully!" -ForegroundColor Green
        } else {
            Write-Host "✗ Push failed. Check token permissions." -ForegroundColor Red
        }
    }
}

Write-Host ""
Write-Host ""

# Step 2: Deployment Instructions
Write-Host "STEP 2: Deploy Frontend to Vercel" -ForegroundColor Yellow
Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor Yellow
Write-Host ""
Write-Host "Manual steps (takes 5 minutes):" -ForegroundColor Cyan
Write-Host "  1. Go to https://vercel.com"
Write-Host "  2. Sign in with GitHub"
Write-Host "  3. Click 'Add New Project'"
Write-Host "  4. Import 'E-Commerce-Platform-with-Secure-Payment-Gateway-Integration'"
Write-Host "  5. Environment Variables:"
Write-Host "     VITE_API_URL=https://your-backend-url.onrender.com/api"
Write-Host "     VITE_STRIPE_PUBLIC_KEY=pk_live_YOUR_KEY"
Write-Host "  6. Build Command: npm run build"
Write-Host "  7. Output Directory: dist"
Write-Host "  8. Click Deploy"
Write-Host ""
Write-Host "Result: Your frontend will be live at https://yourproject.vercel.app" -ForegroundColor Green
Write-Host ""

Write-Host "Press any key to continue..." -ForegroundColor Magenta
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")

Write-Host ""
Write-Host ""

# Step 3: Deploy Backend
Write-Host "STEP 3: Deploy Backend to Railway" -ForegroundColor Yellow
Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor Yellow
Write-Host ""
Write-Host "Manual steps (takes 5 minutes):" -ForegroundColor Cyan
Write-Host "  1. Go to https://railway.app"
Write-Host "  2. Sign in with GitHub"
Write-Host "  3. Click 'New Project'"
Write-Host "  4. Select 'Deploy from GitHub repo'"
Write-Host "  5. Choose 'E-Commerce-Platform-with-Secure-Payment-Gateway-Integration'"
Write-Host "  6. Add Environment Variables:"
Write-Host "     NODE_ENV=production"
Write-Host "     NODE_PORT=5000"
Write-Host "     DB_HOST=your-mysql-host"
Write-Host "     DB_PORT=3306"
Write-Host "     DB_USER=your-user"
Write-Host "     DB_PASSWORD=your-password"
Write-Host "     DB_NAME=ecommerce_db"
Write-Host "     JWT_SECRET=your-secret-key-min-32-chars"
Write-Host "     ENCRYPTION_KEY=32-character-hex-key"
Write-Host "     STRIPE_SECRET_KEY=sk_live_YOUR_KEY"
Write-Host "     PAYPAL_CLIENT_ID=your_id"
Write-Host "     PAYPAL_CLIENT_SECRET=your_secret"
Write-Host "     CORS_ORIGIN=https://your-vercel-frontend.vercel.app"
Write-Host "  7. Click Deploy"
Write-Host ""
Write-Host "Result: Your backend will be live at https://yourbackend.onrender.com/api" -ForegroundColor Green
Write-Host ""

Write-Host "Press any key to continue..." -ForegroundColor Magenta
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")

Write-Host ""
Write-Host ""

# Step 4: Database
Write-Host "STEP 4: Create Cloud Database" -ForegroundColor Yellow
Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor Yellow
Write-Host ""
Write-Host "OPTION A: Railway MySQL (Easiest)" -ForegroundColor Cyan
Write-Host "  1. In Railway dashboard, click 'New Service'"
Write-Host "  2. Select 'MySQL'"
Write-Host "  3. Copy credentials"
Write-Host "  4. Add to Backend .env variables"
Write-Host ""

Write-Host "OPTION B: PlanetScale (Free tier, no time limit)" -ForegroundColor Cyan
Write-Host "  1. Go to https://planetscale.com"
Write-Host "  2. Create a MySQL database"
Write-Host "  3. Copy connection details"
Write-Host "  4. Add to Backend .env variables"
Write-Host ""

Write-Host "OPTION C: Aiven (Free trial)" -ForegroundColor Cyan
Write-Host "  1. Go to https://aiven.io"
Write-Host "  2. Create MySQL database"
Write-Host "  3. Copy credentials"
Write-Host "  4. Add to Backend .env variables"
Write-Host ""

Write-Host "Press any key to continue..." -ForegroundColor Magenta
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")

Write-Host ""
Write-Host ""

# Step 5: Payment Gateway
Write-Host "STEP 5: Configure Payment Gateway" -ForegroundColor Yellow
Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor Yellow
Write-Host ""

Write-Host "OPTION A: Stripe (Recommended)" -ForegroundColor Cyan
Write-Host "  1. Go to https://stripe.com"
Write-Host "  2. Sign up and verify your account"
Write-Host "  3. Go to Settings > API keys"
Write-Host "  4. Copy PUBLISHABLE KEY (pk_live_...)"
Write-Host "  5. Copy SECRET KEY (sk_live_...)"
Write-Host "  6. Set in Vercel (frontend):"
Write-Host "     VITE_STRIPE_PUBLIC_KEY=pk_live_..."
Write-Host "  7. Set in Railway (backend):"
Write-Host "     STRIPE_SECRET_KEY=sk_live_..."
Write-Host ""

Write-Host "OPTION B: Razorpay" -ForegroundColor Cyan
Write-Host "  1. Go to https://razorpay.com"
Write-Host "  2. Create account"
Write-Host "  3. Get API Key ID and Secret"
Write-Host "  4. Add to Railway environment variables"
Write-Host ""

Write-Host "OPTION C: PayPal (We have PayPal already integrated!)" -ForegroundColor Cyan
Write-Host "  1. Go to https://developer.paypal.com"
Write-Host "  2. Create app"
Write-Host "  3. Get Client ID and Secret"
Write-Host "  4. Add to Railway environment variables"
Write-Host ""

Write-Host "Press any key to continue..." -ForegroundColor Magenta
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")

Write-Host ""
Write-Host ""

# Summary
Write-Host "╔════════════════════════════════════════════════════════════╗" -ForegroundColor Green
Write-Host "║  DEPLOYMENT SUMMARY                                        ║" -ForegroundColor Green
Write-Host "╚════════════════════════════════════════════════════════════╝" -ForegroundColor Green
Write-Host ""

Write-Host "Your application will be deployed to:" -ForegroundColor Cyan
Write-Host ""
Write-Host "  Frontend (React):"
Write-Host "    https://yourproject.vercel.app" -ForegroundColor Green
Write-Host ""
Write-Host "  Backend (Node.js/Express):"
Write-Host "    https://yourbackend.onrender.com/api" -ForegroundColor Green
Write-Host ""
Write-Host "  Database (MySQL):"
Write-Host "    Cloud-hosted on Railway/PlanetScale/Aiven" -ForegroundColor Green
Write-Host ""
Write-Host "  Payment:"
Write-Host "    Stripe/PayPal/Razorpay" -ForegroundColor Green
Write-Host ""

Write-Host "NEXT STEPS:" -ForegroundColor Yellow
Write-Host ""
Write-Host "1. Complete GitHub push (if needed)"
Write-Host "2. Deploy Frontend to Vercel"
Write-Host "3. Deploy Backend to Railway"
Write-Host "4. Set up Cloud Database"
Write-Host "5. Configure Payment Gateway"
Write-Host "6. Test your application"
Write-Host ""

Write-Host "All steps take approximately 30-45 minutes" -ForegroundColor Magenta
Write-Host ""

Write-Host "Documentation files available:" -ForegroundColor Cyan
Write-Host "  - DEPLOYMENT_GUIDE.md"
Write-Host "  - docs/GITHUB_DEPLOYMENT.md"
Write-Host "  - docs/DEPLOYMENT_HOSTING.md"
Write-Host "  - docs/API.md"
Write-Host ""

Write-Host "Ready to deploy? Start with Vercel and Railway! 🚀" -ForegroundColor Green
