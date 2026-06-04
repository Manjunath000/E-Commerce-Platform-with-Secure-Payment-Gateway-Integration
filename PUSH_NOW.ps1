# Fast GitHub Authentication & Push
# This script fixes the permission issue by using your own GitHub account

Write-Host "╔════════════════════════════════════════════════════════════╗" -ForegroundColor Cyan
Write-Host "║     GitHub Authentication - Push to YOUR Account           ║" -ForegroundColor Cyan
Write-Host "╚════════════════════════════════════════════════════════════╝" -ForegroundColor Cyan
Write-Host ""

# Get GitHub username
$githubUsername = Read-Host "Enter YOUR GitHub username (not Manjunath000)"
Write-Host ""

if (-not $githubUsername -or $githubUsername -eq "Manjunath000") {
    Write-Host "⚠️  You can't push to Manjunath000's repo!" -ForegroundColor Red
    Write-Host ""
    Write-Host "You need to:" -ForegroundColor Yellow
    Write-Host "  Option 1: Create a NEW repository in your account"
    Write-Host "  Option 2: Fork Manjunath000's repository to your account"
    Write-Host ""
    Write-Host "Go to: https://github.com/new" -ForegroundColor Cyan
    Write-Host "Create repository: E-Commerce-Platform-with-Secure-Payment-Gateway-Integration"
    Write-Host ""
    exit
}

Write-Host "✓ Using GitHub account: $githubUsername" -ForegroundColor Green
Write-Host ""
Write-Host "Getting Personal Access Token..." -ForegroundColor Cyan
Write-Host "Instructions:" -ForegroundColor Yellow
Write-Host "  1. Go to https://github.com/settings/tokens"
Write-Host "  2. Click 'Generate new token (classic)'"
Write-Host "  3. Select these scopes:"
Write-Host "     ☑ repo (full control)"
Write-Host "     ☑ write:repo_hook"
Write-Host "  4. Click Generate and copy the token"
Write-Host ""

$token = Read-Host "Paste your GitHub Personal Access Token"

if (-not $token) {
    Write-Host "⚠️  No token provided" -ForegroundColor Red
    exit
}

Write-Host ""
Write-Host "✓ Token received" -ForegroundColor Green
Write-Host ""

# Get repository name
$repoName = "E-Commerce-Platform-with-Secure-Payment-Gateway-Integration"

Write-Host "Configuring Git..." -ForegroundColor Cyan

# Set git user
git config user.name $githubUsername
git config user.email "$githubUsername@github.com"

# Remove old remote
git remote remove origin 2>&1 | Out-Null

# Add new remote with credentials
$newRemoteUrl = "https://${githubUsername}:${token}@github.com/${githubUsername}/${repoName}.git"
git remote add origin $newRemoteUrl

Write-Host "✓ Git configured for user: $githubUsername" -ForegroundColor Green
Write-Host ""
Write-Host "Pushing code to GitHub..." -ForegroundColor Cyan
Write-Host ""

git push -u origin main -v

if ($LASTEXITCODE -eq 0) {
    Write-Host ""
    Write-Host "╔════════════════════════════════════════════════════════════╗" -ForegroundColor Green
    Write-Host "║  ✓ CODE PUSHED SUCCESSFULLY!                              ║" -ForegroundColor Green
    Write-Host "╚════════════════════════════════════════════════════════════╝" -ForegroundColor Green
    Write-Host ""
    Write-Host "Repository URL:" -ForegroundColor Cyan
    Write-Host "https://github.com/$githubUsername/$repoName" -ForegroundColor Green
    Write-Host ""
    Write-Host "NEXT STEPS:" -ForegroundColor Yellow
    Write-Host "  1. Go to https://vercel.com"
    Write-Host "  2. Sign in with GitHub"
    Write-Host "  3. Import your repository: https://github.com/$githubUsername/$repoName"
    Write-Host "  4. Deploy to Vercel"
    Write-Host ""
    Write-Host "Then go to https://railway.app and deploy the backend"
    Write-Host ""
    Write-Host "🎉 Your app will be live in 10 minutes!" -ForegroundColor Green
} else {
    Write-Host ""
    Write-Host "✗ Push failed" -ForegroundColor Red
    Write-Host ""
    Write-Host "Troubleshooting:" -ForegroundColor Yellow
    Write-Host "  1. Make sure you created a repo in your account first"
    Write-Host "     Go to: https://github.com/new"
    Write-Host "     Name: E-Commerce-Platform-with-Secure-Payment-Gateway-Integration"
    Write-Host ""
    Write-Host "  2. Verify your token is correct:"
    Write-Host "     - Copy it completely (no extra spaces)"
    Write-Host "     - Repo scope should be selected"
    Write-Host ""
    Write-Host "  3. Try again with the correct token"
}
