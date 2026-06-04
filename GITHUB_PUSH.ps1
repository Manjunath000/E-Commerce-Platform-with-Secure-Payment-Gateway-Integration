# Quick GitHub Push Helper
# Copy your Personal Access Token and username below

Write-Host "═══════════════════════════════════════════════════════════" -ForegroundColor Cyan
Write-Host "GitHub Push Authentication Helper" -ForegroundColor Cyan
Write-Host "═══════════════════════════════════════════════════════════" -ForegroundColor Cyan
Write-Host ""

# Check if already pushed
$remoteUrl = git remote get-url origin
if ($remoteUrl -like "*github.com*") {
    Write-Host "✓ Remote already configured: $remoteUrl" -ForegroundColor Green
} else {
    Write-Host "Need to configure GitHub remote" -ForegroundColor Yellow
}

Write-Host ""
Write-Host "OPTION 1: Personal Access Token (Recommended)" -ForegroundColor Yellow
Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor Yellow
Write-Host ""
Write-Host "To get your Personal Access Token:"
Write-Host "  1. Go to https://github.com/settings/tokens"
Write-Host "  2. Click 'Generate new token (classic)'"
Write-Host "  3. Select scopes:"
Write-Host "     ☑ repo (full control)"
Write-Host "     ☑ read:user"
Write-Host "     ☑ write:repo_hook"
Write-Host "  4. Click 'Generate token'"
Write-Host "  5. Copy the token (save it safely!)"
Write-Host ""

$continue = Read-Host "Do you have a Personal Access Token? (Y/N)"

if ($continue -eq "Y" -or $continue -eq "y") {
    $username = Read-Host "Enter your GitHub username"
    $token = Read-Host "Paste your Personal Access Token" -AsSecureString
    
    # Convert secure string to plain text
    $tokenPlain = [System.Runtime.InteropServices.Marshal]::PtrToStringAuto([System.Runtime.InteropServices.Marshal]::SecureStringToCoTaskMemUnicode($token))
    
    Write-Host ""
    Write-Host "Configuring Git credentials..." -ForegroundColor Cyan
    
    # Configure git user
    git config user.name $username
    git config user.email "$username@github.com"
    
    # Remove old remote if exists
    $oldRemote = git remote remove origin 2>&1
    
    # Add new remote with credentials
    $repoUrl = "https://${username}:${tokenPlain}@github.com/${username}/E-Commerce-Platform-with-Secure-Payment-Gateway-Integration.git"
    git remote add origin $repoUrl
    
    Write-Host "✓ Git configured" -ForegroundColor Green
    Write-Host ""
    Write-Host "Pushing to GitHub..." -ForegroundColor Cyan
    git push -u origin main -v
    
    if ($LASTEXITCODE -eq 0) {
        Write-Host ""
        Write-Host "╔═══════════════════════════════════════════════════════════╗" -ForegroundColor Green
        Write-Host "║  ✓ Code pushed successfully to GitHub!                   ║" -ForegroundColor Green
        Write-Host "╚═══════════════════════════════════════════════════════════╝" -ForegroundColor Green
        Write-Host ""
        Write-Host "Your repository is now ready for deployment!" -ForegroundColor Green
        Write-Host ""
        Write-Host "Next steps:" -ForegroundColor Cyan
        Write-Host "  1. Go to https://vercel.com → Deploy Frontend" -ForegroundColor Cyan
        Write-Host "  2. Go to https://railway.app → Deploy Backend" -ForegroundColor Cyan
        Write-Host "  3. Set up cloud database (Railway/PlanetScale)" -ForegroundColor Cyan
        Write-Host "  4. Configure payment gateway (Stripe/PayPal)" -ForegroundColor Cyan
    } else {
        Write-Host ""
        Write-Host "✗ Push failed" -ForegroundColor Red
        Write-Host ""
        Write-Host "Troubleshooting:" -ForegroundColor Yellow
        Write-Host "  - Verify your token has 'repo' scope"
        Write-Host "  - Check your username is correct"
        Write-Host "  - Ensure token hasn't expired"
        Write-Host "  - Try creating a new token"
    }
} else {
    Write-Host ""
    Write-Host "OPTION 2: SSH Keys" -ForegroundColor Yellow
    Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor Yellow
    Write-Host ""
    Write-Host "Alternative: Use SSH with public/private key pair"
    Write-Host "  1. Generate key: ssh-keygen -t ed25519"
    Write-Host "  2. Add to GitHub: https://github.com/settings/keys"
    Write-Host "  3. Run: git remote set-url origin git@github.com:USERNAME/REPO.git"
    Write-Host "  4. Then: git push -u origin main"
    Write-Host ""
}
