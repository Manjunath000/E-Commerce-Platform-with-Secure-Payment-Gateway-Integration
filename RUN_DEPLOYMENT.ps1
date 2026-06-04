# 🚀 AUTOMATED GITHUB PUSH + LIVE DEPLOYMENT LINKS
# This will push your code and show you the live URLs

Write-Host "╔══════════════════════════════════════════════════════════════╗" -ForegroundColor Cyan
Write-Host "║  E-COMMERCE PLATFORM - AUTOMATED GITHUB PUSH                ║" -ForegroundColor Cyan
Write-Host "║  You'll get live links at the end!                          ║" -ForegroundColor Cyan
Write-Host "╚══════════════════════════════════════════════════════════════╝" -ForegroundColor Cyan
Write-Host ""

# Step 1: Get GitHub credentials
Write-Host "STEP 1: Get Your GitHub Personal Access Token" -ForegroundColor Yellow
Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor Yellow
Write-Host ""
Write-Host "This takes 1 MINUTE! Follow these steps:" -ForegroundColor Cyan
Write-Host ""
Write-Host "1. Click here: https://github.com/settings/tokens" -ForegroundColor Green
Write-Host "2. Click 'Generate new token (classic)'" -ForegroundColor Green
Write-Host "3. In the 'Note' field, type: ecommerce-github-token" -ForegroundColor Green
Write-Host "4. Check ONLY this box: ☑ repo" -ForegroundColor Green
Write-Host "5. Scroll down and click 'Generate token'" -ForegroundColor Green
Write-Host "6. COPY THE TOKEN (you won't see it again!)" -ForegroundColor Green
Write-Host ""

Write-Host "Open this link now and get your token: https://github.com/settings/tokens" -ForegroundColor Magenta
Write-Host ""

# Wait for user to create token
Write-Host "Have you created the token? (Y/N)" -ForegroundColor Yellow
$hasToken = Read-Host "Enter Y or N"

if ($hasToken -ne "Y" -and $hasToken -ne "y") {
    Write-Host ""
    Write-Host "⚠️  Token is required to push to GitHub" -ForegroundColor Red
    Write-Host "Please go to: https://github.com/settings/tokens" -ForegroundColor Yellow
    Write-Host "Then run this script again" -ForegroundColor Yellow
    exit
}

Write-Host ""
Write-Host "STEP 2: Enter Your GitHub Information" -ForegroundColor Yellow
Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor Yellow
Write-Host ""

$githubUsername = Read-Host "Enter your GitHub USERNAME (e.g., yourname)"
$token = Read-Host "Paste your GitHub TOKEN" -AsSecureString

# Convert secure string to plain
$tokenPlain = [System.Runtime.InteropServices.Marshal]::PtrToStringAuto([System.Runtime.InteropServices.Marshal]::SecureStringToCoTaskMemUnicode($token))

Write-Host ""
Write-Host "STEP 3: Creating Your Repository" -ForegroundColor Yellow
Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor Yellow
Write-Host ""
Write-Host "You need to create a NEW repository in your GitHub account" -ForegroundColor Cyan
Write-Host ""
Write-Host "Go here: https://github.com/new" -ForegroundColor Green
Write-Host ""
Write-Host "Fill in:" -ForegroundColor Yellow
Write-Host "  Repository name: E-Commerce-Platform-with-Secure-Payment-Gateway-Integration" -ForegroundColor Green
Write-Host "  Description: Full-stack e-commerce with payment gateway" -ForegroundColor Green
Write-Host "  Private/Public: PUBLIC (so you can deploy)" -ForegroundColor Green
Write-Host "  Do NOT initialize with README" -ForegroundColor Green
Write-Host ""
Write-Host "Click 'Create repository'" -ForegroundColor Green
Write-Host ""

$repoCreated = Read-Host "Have you created the repository? (Y/N)"

if ($repoCreated -ne "Y" -and $repoCreated -ne "y") {
    Write-Host ""
    Write-Host "⚠️  Repository is required" -ForegroundColor Red
    Write-Host "Please create it at: https://github.com/new" -ForegroundColor Yellow
    exit
}

Write-Host ""
Write-Host "STEP 4: Pushing Code to GitHub" -ForegroundColor Yellow
Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor Yellow
Write-Host ""

# Navigate to project
Set-Location "c:\E-Commerce Platform with Secure Payment Gateway Integration"

# Configure git
Write-Host "Configuring Git..." -ForegroundColor Cyan
git config --global user.name $githubUsername
git config --global user.email "$githubUsername@github.com"

# Remove old remote
git remote remove origin 2>&1 | Out-Null

# Add new remote with token
$repoName = "E-Commerce-Platform-with-Secure-Payment-Gateway-Integration"
$remoteUrl = "https://${githubUsername}:${tokenPlain}@github.com/${githubUsername}/${repoName}.git"
git remote add origin $remoteUrl

# Push code
Write-Host "Publishing your code to GitHub..." -ForegroundColor Cyan
Write-Host ""
git push -u origin main

if ($LASTEXITCODE -eq 0) {
    Write-Host ""
    Write-Host "╔══════════════════════════════════════════════════════════════╗" -ForegroundColor Green
    Write-Host "║  ✅ CODE PUSHED SUCCESSFULLY!                               ║" -ForegroundColor Green
    Write-Host "╚══════════════════════════════════════════════════════════════╝" -ForegroundColor Green
    
    $repoUrl = "https://github.com/${githubUsername}/${repoName}"
    
    Write-Host ""
    Write-Host "Your Repository:" -ForegroundColor Cyan
    Write-Host $repoUrl -ForegroundColor Green
    Write-Host ""
    
    Write-Host "STEP 5: Deploy to VERCEL (Frontend) - 5 MINUTES" -ForegroundColor Yellow
    Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor Yellow
    Write-Host ""
    Write-Host "1. Go to: https://vercel.com" -ForegroundColor Green
    Write-Host "2. Click 'Sign in with GitHub'" -ForegroundColor Green
    Write-Host "3. Click 'Add New Project'" -ForegroundColor Green
    Write-Host "4. Find: E-Commerce-Platform-with-Secure-Payment-Gateway-Integration" -ForegroundColor Green
    Write-Host "5. Click 'Import'" -ForegroundColor Green
    Write-Host "6. Settings:" -ForegroundColor Green
    Write-Host "   - Framework: Vite" -ForegroundColor Green
    Write-Host "   - Build: npm run build" -ForegroundColor Green
    Write-Host "   - Output: dist" -ForegroundColor Green
    Write-Host "7. Environment Variables:" -ForegroundColor Green
    Write-Host "   VITE_API_URL = https://your-backend.onrender.com/api" -ForegroundColor Green
    Write-Host "   VITE_STRIPE_PUBLIC_KEY = pk_live_YOUR_KEY" -ForegroundColor Green
    Write-Host "8. Click 'Deploy'" -ForegroundColor Green
    Write-Host ""
    Write-Host "⏱️  3-5 minutes later..." -ForegroundColor Magenta
    Write-Host "Your Frontend URL: https://your-project.vercel.app" -ForegroundColor Green
    Write-Host ""
    
    Write-Host "STEP 6: Deploy to RAILWAY (Backend) - 5 MINUTES" -ForegroundColor Yellow
    Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor Yellow
    Write-Host ""
    Write-Host "1. Go to: https://railway.app" -ForegroundColor Green
    Write-Host "2. Click 'Sign in with GitHub'" -ForegroundColor Green
    Write-Host "3. Click 'New Project'" -ForegroundColor Green
    Write-Host "4. Select 'Deploy from GitHub repo'" -ForegroundColor Green
    Write-Host "5. Find: E-Commerce-Platform-with-Secure-Payment-Gateway-Integration" -ForegroundColor Green
    Write-Host "6. Click to import" -ForegroundColor Green
    Write-Host "7. Environment Variables (ADD THESE):" -ForegroundColor Green
    Write-Host "   NODE_ENV=production" -ForegroundColor Green
    Write-Host "   NODE_PORT=5000" -ForegroundColor Green
    Write-Host "   DB_HOST=your-mysql-host" -ForegroundColor Green
    Write-Host "   DB_PORT=3306" -ForegroundColor Green
    Write-Host "   DB_USER=your-user" -ForegroundColor Green
    Write-Host "   DB_PASSWORD=your-password" -ForegroundColor Green
    Write-Host "   DB_NAME=ecommerce_db" -ForegroundColor Green
    Write-Host "   JWT_SECRET=use-32-char-secret-here" -ForegroundColor Green
    Write-Host "   ENCRYPTION_KEY=use-32-char-hex-key" -ForegroundColor Green
    Write-Host "   STRIPE_SECRET_KEY=sk_live_YOUR_KEY" -ForegroundColor Green
    Write-Host "   CORS_ORIGIN=https://your-vercel-url.vercel.app" -ForegroundColor Green
    Write-Host "8. Click 'Deploy'" -ForegroundColor Green
    Write-Host ""
    Write-Host "⏱️  5 minutes later..." -ForegroundColor Magenta
    Write-Host "Your Backend URL: https://your-backend.onrender.com/api" -ForegroundColor Green
    Write-Host ""
    
    Write-Host "STEP 7: Create Database - 5 MINUTES" -ForegroundColor Yellow
    Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor Yellow
    Write-Host ""
    Write-Host "Option A - Railway MySQL (Easiest):" -ForegroundColor Green
    Write-Host "  1. In Railway, click 'New Service'" -ForegroundColor Green
    Write-Host "  2. Select 'MySQL'" -ForegroundColor Green
    Write-Host "  3. Copy credentials to Backend .env" -ForegroundColor Green
    Write-Host ""
    Write-Host "Option B - PlanetScale (Free forever):" -ForegroundColor Green
    Write-Host "  1. Go to: https://planetscale.com" -ForegroundColor Green
    Write-Host "  2. Create database" -ForegroundColor Green
    Write-Host "  3. Copy credentials" -ForegroundColor Green
    Write-Host ""
    
    Write-Host "STEP 8: Add Payment Gateway - 5 MINUTES" -ForegroundColor Yellow
    Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor Yellow
    Write-Host ""
    Write-Host "1. Go to: https://stripe.com" -ForegroundColor Green
    Write-Host "2. Create account" -ForegroundColor Green
    Write-Host "3. Get API keys" -ForegroundColor Green
    Write-Host "4. Add to Vercel + Railway" -ForegroundColor Green
    Write-Host ""
    
    Write-Host "╔══════════════════════════════════════════════════════════════╗" -ForegroundColor Green
    Write-Host "║  🎉 YOU'RE ALL SET!                                         ║" -ForegroundColor Green
    Write-Host "║  Follow steps 5-8 above to go LIVE!                         ║" -ForegroundColor Green
    Write-Host "║  Total time: 25-30 minutes                                  ║" -ForegroundColor Green
    Write-Host "╚══════════════════════════════════════════════════════════════╝" -ForegroundColor Green
    Write-Host ""
    
    Write-Host "📋 SUMMARY:" -ForegroundColor Cyan
    Write-Host "  GitHub: $repoUrl" -ForegroundColor Green
    Write-Host "  Frontend will be: https://your-project.vercel.app" -ForegroundColor Green
    Write-Host "  Backend will be: https://your-backend.onrender.com/api" -ForegroundColor Green
    Write-Host "  Database: Cloud MySQL" -ForegroundColor Green
    Write-Host "  Payments: Stripe/PayPal live" -ForegroundColor Green
    Write-Host ""
    Write-Host "Share the frontend URL with anyone to let them use your store!" -ForegroundColor Magenta
    Write-Host ""

} else {
    Write-Host ""
    Write-Host "✗ Push failed" -ForegroundColor Red
    Write-Host ""
    Write-Host "Troubleshooting:" -ForegroundColor Yellow
    Write-Host "  1. Make sure you created the repository at: https://github.com/new" -ForegroundColor Yellow
    Write-Host "  2. Make sure repository is PUBLIC (not private)" -ForegroundColor Yellow
    Write-Host "  3. Verify token is correct (no extra spaces)" -ForegroundColor Yellow
    Write-Host "  4. Try running the script again" -ForegroundColor Yellow
}
