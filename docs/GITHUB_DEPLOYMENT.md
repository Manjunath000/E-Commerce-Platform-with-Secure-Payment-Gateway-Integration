# GitHub Deployment Guide

## Step 1: Push Project to GitHub

### 1.1 Create GitHub Repository

1. Go to https://github.com/new
2. Enter repository name: `ecommerce-platform`
3. Add description: "E-Commerce Platform with Secure Payment Gateway"
4. Choose Public (to easily share links)
5. Click "Create repository"

### 1.2 Initialize Git and Push

```bash
cd "E-Commerce Platform with Secure Payment Gateway Integration"

# Initialize git
git init

# Add all files
git add .

# Create initial commit
git commit -m "Initial commit: Complete e-commerce platform with Docker setup"

# Add remote
git remote add origin https://github.com/yourusername/ecommerce-platform.git

# Push to GitHub
git branch -M main
git push -u origin main
```

## Step 2: GitHub Actions CI/CD

The `.github/workflows/ci-cd.yml` is already configured to:

1. **Test** on every push
2. **Build** Docker images
3. **Push** to GitHub Container Registry
4. **Deploy** to production (when configured)

### 2.1 Enable GitHub Actions

1. Go to repository Settings
2. Click "Actions" → "General"
3. Ensure "Allow all actions and reusable workflows" is selected

### 2.2 View Workflow Status

- Go to "Actions" tab in your repository
- See workflow runs for each commit

## Step 3: Deployment Options

### Option A: Deploy to Heroku (Recommended for Quick Start)

#### Prerequisites
- Heroku account: https://www.heroku.com
- Heroku CLI: https://devcenter.heroku.com/articles/heroku-cli

#### Steps

1. **Create Heroku Apps**
   ```bash
   heroku create ecommerce-backend
   heroku create ecommerce-frontend
   ```

2. **Add Database**
   ```bash
   heroku addons:create cleardb:ignite -a ecommerce-backend
   ```

3. **Set Environment Variables**
   ```bash
   heroku config:set JWT_SECRET=your_secret -a ecommerce-backend
   heroku config:set STRIPE_SECRET_KEY=your_key -a ecommerce-backend
   # ... set other variables
   ```

4. **Deploy**
   ```bash
   git push heroku main
   ```

### Option B: Deploy to Railway (Easiest)

Railway is the easiest way to deploy:

1. Go to https://railway.app
2. Sign up with GitHub
3. Click "New Project" → "Deploy from GitHub repo"
4. Select your repository
5. Add MySQL plugin
6. Set environment variables
7. Deploy automatically!

**Cost**: Free tier available (5GB storage, 5GB bandwidth)

### Option C: Deploy to DigitalOcean (Production Grade)

#### Steps

1. **Create Droplet**
   - Ubuntu 20.04 / 22.04
   - 2GB+ RAM
   - Enable Docker from app marketplace

2. **SSH into Droplet**
   ```bash
   ssh root@your_droplet_ip
   ```

3. **Clone Repository**
   ```bash
   git clone https://github.com/yourusername/ecommerce-platform.git
   cd ecommerce-platform
   ```

4. **Create .env File**
   ```bash
   cp .env.example .env
   nano .env  # Edit with your settings
   ```

5. **Start Services**
   ```bash
   docker-compose -f docker-compose.yml up -d
   ```

6. **Setup Domain**
   - Point domain DNS to droplet IP
   - Update CLIENT_URL in .env

### Option D: Deploy to AWS ECS (Enterprise)

1. Create ECR repositories for images
2. Push images to ECR
3. Create ECS cluster and tasks
4. Set up RDS for MySQL
5. Configure ALB and Auto Scaling

### Option E: Deploy to Docker Hub + Portainer (Simple Management)

1. **Push Images to Docker Hub**
   ```bash
   docker login
   docker tag ecommerce-backend yourusername/ecommerce-backend:latest
   docker push yourusername/ecommerce-backend:latest
   
   docker tag ecommerce-frontend yourusername/ecommerce-frontend:latest
   docker push yourusername/ecommerce-frontend:latest
   ```

2. **Deploy on Any VPS with Portainer**
   - Install Portainer: `docker run -d -p 9000:9000 -v /var/run/docker.sock:/var/run/docker.sock portainer/portainer-ce`
   - Access: http://your_vps:9000
   - Deploy using Docker Compose GUI

## Step 4: Make It Publicly Accessible

### Option 1: Custom Domain

1. Buy domain from registrar (GoDaddy, Namecheap, etc.)
2. Point DNS to your server/deployment IP
3. Update environment variables:
   ```env
   CLIENT_URL=https://yourdomain.com
   VITE_API_URL=https://yourdomain.com/api
   ```

### Option 2: Use Provided URL

- **Heroku**: `https://ecommerce-backend.herokuapp.com`
- **Railway**: `https://yourdomain-production.up.railway.app`
- **DigitalOcean**: `https://your_droplet_ip`

### Option 3: Use SSH Tunnel for Development

```bash
ssh -L 3000:localhost:3000 -L 5000:localhost:5000 user@server_ip
```

## Step 5: GitHub README with Live Demo Link

Update your `README.md`:

```markdown
# E-Commerce Platform

![CI/CD Status](https://github.com/yourusername/ecommerce-platform/workflows/CI%2FCD%20Pipeline/badge.svg)

## 🌐 Live Demo

- **Frontend**: https://yourdomain.com
- **API Docs**: https://yourdomain.com/api/docs
- **Database Manager**: https://yourdomain.com:8080 (phpMyAdmin)

## 🚀 Quick Start

### One-Click Deploy

[![Deploy to Railway](https://railway.app/button.svg)](https://railway.app/new/template?templateUrl=https://github.com/yourusername/ecommerce-platform)

### Local Development

```bash
git clone https://github.com/yourusername/ecommerce-platform.git
docker-compose up -d
```

## 📚 Documentation

- [Setup Guide](./docs/SETUP.md)
- [Docker Deployment](./docs/DOCKER_DEPLOYMENT.md)
- [API Documentation](./docs/API.md)
- [Deployment Guide](./docs/GITHUB_DEPLOYMENT.md)
```

## Step 6: Add Badges to GitHub

Add to your README:

```markdown
[![GitHub Stars](https://img.shields.io/github/stars/yourusername/ecommerce-platform?style=social)](https://github.com/yourusername/ecommerce-platform)
[![License](https://img.shields.io/badge/license-ISC-blue.svg)](./LICENSE)
[![Node](https://img.shields.io/badge/node-%3E%3D14.0.0-brightgreen)](https://nodejs.org)
[![Docker](https://img.shields.io/badge/docker-ready-blue)](./docs/DOCKER_DEPLOYMENT.md)
```

## Step 7: Set Up GitHub Secrets for CI/CD

1. Go to Settings → Secrets and variables → Actions
2. Add secrets:
   - `REGISTRY_USERNAME`: Your Docker Hub username
   - `REGISTRY_PASSWORD`: Your Docker Hub password
   - `DEPLOYMENT_KEY`: SSH key for deployment (optional)

```bash
# Reference in workflow
- name: Login to Registry
  run: echo "${{ secrets.REGISTRY_PASSWORD }}" | docker login -u "${{ secrets.REGISTRY_USERNAME }}" --password-stdin
```

## Step 8: Automated Deployments

Update `.github/workflows/ci-cd.yml` deployment step:

### For Heroku
```yaml
- name: Deploy to Heroku
  env:
    HEROKU_API_KEY: ${{ secrets.HEROKU_API_KEY }}
  run: |
    git push https://heroku:${HEROKU_API_KEY}@git.heroku.com/ecommerce-backend.git main
```

### For DigitalOcean
```yaml
- name: Deploy to DigitalOcean
  uses: appleboy/ssh-action@master
  with:
    host: ${{ secrets.DO_HOST }}
    username: ${{ secrets.DO_USER }}
    key: ${{ secrets.DO_SSH_KEY }}
    script: |
      cd ~/ecommerce-platform
      git pull origin main
      docker-compose up -d --build
```

## Monitoring & Maintenance

### Monitor Deployments
- GitHub Actions: See workflow runs
- Sentry: Monitor errors (add to backend)
- Datadog: Monitor infrastructure
- Uptime Robot: Monitor availability

### Database Backups
```bash
# Automated backup script
0 2 * * * docker-compose exec mysql mysqldump -u ecommerce -pecommerce123 ecommerce > /backups/ecommerce-$(date +\%Y\%m\%d).sql
```

### Update Dependencies
```bash
# In backend
npm update
npm audit fix

# In frontend
npm update
npm audit fix

# Commit and push
git commit -am "deps: update dependencies"
git push origin main
```

## Troubleshooting Deployments

### Workflow Fails
- Check GitHub Actions logs
- Verify secrets are set
- Check branch protection rules

### Application Doesn't Start
- View container logs: `docker-compose logs backend`
- Check environment variables
- Verify database connection

### Database Connection Issues
- Ensure MySQL service is healthy
- Check firewall rules
- Verify credentials in .env

## Security Checklist

- [ ] No secrets in .env committed
- [ ] Use strong JWT_SECRET
- [ ] Enable HTTPS/SSL
- [ ] Set database password strong
- [ ] Enable GitHub branch protection
- [ ] Review GitHub Actions permissions
- [ ] Set up rate limiting
- [ ] Enable CORS for specific domains only

## Resources

- [GitHub Actions Documentation](https://docs.github.com/en/actions)
- [Docker Documentation](https://docs.docker.com)
- [Railway Deployment Docs](https://docs.railway.app)
- [Heroku Deployment Guide](https://devcenter.heroku.com)
- [DigitalOcean App Platform](https://docs.digitalocean.com/products/app-platform)
