# Git Setup & GitHub Guide

## Initial Setup

### 1. Configure Git (First Time)

```bash
git config --global user.name "Your Name"
git config --global user.email "your.email@example.com"
```

### 2. Create GitHub Account

1. Go to https://github.com/signup
2. Complete registration
3. Verify email

### 3. Create SSH Key (Secure Connection)

```powershell
# Generate SSH key
ssh-keygen -t ed25519 -C "your.email@example.com"

# Press Enter for all prompts
# View public key
cat ~/.ssh/id_ed25519.pub
```

Add to GitHub:
1. Go to GitHub Settings → SSH and GPG keys
2. Click "New SSH key"
3. Paste your public key

### 4. Clone & Setup Project

```bash
# Navigate to workspace
cd "C:\E-Commerce Platform with Secure Payment Gateway Integration"

# Initialize Git
git init

# Configure remote
git remote add origin https://github.com/yourusername/ecommerce-platform.git

# Add all files
git add .

# Initial commit
git commit -m "Initial commit: Complete e-commerce platform with Docker"

# Push to GitHub
git branch -M main
git push -u origin main
```

## GitHub Repository Structure

```
ecommerce-platform/
├── .github/
│   └── workflows/        # CI/CD pipelines
├── .gitignore           # Files to ignore
├── backend/             # Node.js backend
├── frontend/            # React frontend
├── database/            # SQL migrations
├── docs/                # Documentation
├── Dockerfile.backend   # Backend container
├── Dockerfile.frontend  # Frontend container
├── docker-compose.yml   # Multi-container setup
├── nginx.conf          # Web server config
└── README.md           # Project overview
```

## Daily Git Workflow

### Create Feature Branch

```bash
git checkout -b feature/add-new-feature
```

### Make Changes

```bash
git status              # See what changed
git add src/            # Stage changes
git commit -m "feat: add new feature"
```

### Push to GitHub

```bash
git push origin feature/add-new-feature
```

### Create Pull Request

1. Go to GitHub repository
2. Click "Compare & pull request"
3. Add description
4. Click "Create pull request"
5. Wait for CI/CD checks
6. Merge when ready

### Merge to Main

```bash
git checkout main
git pull origin main
git merge feature/add-new-feature
git push origin main
```

### Delete Feature Branch

```bash
git branch -d feature/add-new-feature
git push origin --delete feature/add-new-feature
```

## Common Git Commands

```bash
# View commit history
git log --oneline

# Check status
git status

# Undo changes
git checkout -- filename
git reset --hard HEAD

# View changes
git diff
git diff --staged

# Stash changes
git stash
git stash pop

# Rebase on main
git rebase main

# View branches
git branch -a

# Create and switch branch
git checkout -b branch-name

# Switch branch
git checkout branch-name

# Delete branch
git branch -d branch-name

# Merge branches
git merge branch-name

# Push changes
git push origin branch-name

# Pull changes
git pull origin main
```

## GitHub Collaboration

### Fork Workflow

```bash
# 1. Fork repository on GitHub

# 2. Clone your fork
git clone https://github.com/yourusername/ecommerce-platform.git
cd ecommerce-platform

# 3. Add upstream remote
git remote add upstream https://github.com/original/ecommerce-platform.git

# 4. Keep your fork updated
git fetch upstream
git rebase upstream/main

# 5. Push to your fork
git push origin main

# 6. Create pull request from GitHub
```

### Code Review Process

1. **Author**: Push code to feature branch
2. **Reviewer**: Review code on pull request
3. **Author**: Make requested changes
4. **Reviewer**: Approve changes
5. **Maintainer**: Merge to main

## Protected Branches

Protect `main` branch:

1. Go to Repository Settings
2. Click "Branches"
3. Add rule for `main`
4. Enable:
   - Require pull request reviews
   - Require status checks to pass
   - Require branches to be up to date

## GitHub Secrets for CI/CD

1. Go to Settings → Secrets and variables → Actions
2. Add New Secret

### For Docker Registry

```
REGISTRY_USERNAME=your_docker_username
REGISTRY_PASSWORD=your_docker_password
DOCKER_REGISTRY=docker.io
```

### For Deployment

```
DEPLOYMENT_PRIVATE_KEY=your_ssh_private_key
DEPLOYMENT_HOST=your_server_ip
DEPLOYMENT_USER=your_server_user
```

### For APIs

```
STRIPE_SECRET_KEY=sk_test_...
PAYPAL_CLIENT_ID=...
```

## GitHub Pages (Free Hosting)

Deploy documentation:

1. Go to Settings → Pages
2. Select "main" branch
3. Select "/docs" folder
4. Click "Save"

Access at: `https://yourusername.github.io/ecommerce-platform`

## GitHub Issues & Projects

### Create Issue

1. Click "Issues" tab
2. Click "New issue"
3. Add title and description
4. Add labels (bug, feature, documentation)
5. Assign to team member

### GitHub Projects

1. Click "Projects" tab
2. Create new board
3. Add columns: Todo, In Progress, Done
4. Link issues to cards
5. Automate workflow

## Release Management

### Create Release

```bash
# Create tag
git tag -a v1.0.0 -m "Release version 1.0.0"

# Push tag
git push origin v1.0.0
```

GitHub:
1. Go to "Releases"
2. Click "Create a new release"
3. Select tag
4. Add release notes
5. Click "Publish release"

### Semantic Versioning

- **Major** (1.0.0): Breaking changes
- **Minor** (1.1.0): New features
- **Patch** (1.0.1): Bug fixes

## Troubleshooting

### Push Rejected

```bash
# Pull latest changes first
git pull origin main

# Resolve conflicts if any
# Then push again
git push origin main
```

### Lost Commits

```bash
# Find commit
git reflog

# Recover
git reset --hard <commit-hash>
```

### Accidentally Committed

```bash
# Undo last commit (keep changes)
git reset --soft HEAD~1

# Undo last commit (discard changes)
git reset --hard HEAD~1
```

## Best Practices

1. **Commit Often**: Small, logical commits
2. **Good Messages**: 
   - feat: new feature
   - fix: bug fix
   - docs: documentation
   - refactor: code refactoring
   - test: adding tests

3. **Pull Before Push**: Always pull latest before pushing
4. **Use Branches**: Never commit directly to main
5. **Code Review**: Get feedback before merging
6. **Write Tests**: Ensure code quality
7. **Update Documentation**: Keep docs in sync

## Resources

- [GitHub Docs](https://docs.github.com)
- [Git Official Docs](https://git-scm.com/doc)
- [GitHub CLI](https://cli.github.com)
- [GitHub Desktop](https://desktop.github.com)
