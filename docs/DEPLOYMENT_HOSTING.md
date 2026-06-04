# Deployment & Hosting Comparison

## Quick Comparison Table

| Platform | Cost | Ease | Scalability | Support | Best For |
|----------|------|------|-------------|---------|----------|
| Railway | $5-20/mo | ⭐⭐⭐⭐⭐ | Good | Email | Quick Start |
| Heroku | $7-50/mo | ⭐⭐⭐⭐ | Limited | Email | Small Apps |
| DigitalOcean | $5-20/mo | ⭐⭐⭐ | Excellent | Docs | Production |
| AWS | $10-100+/mo | ⭐⭐ | Excellent | Chat | Enterprise |
| Vercel | $20+/mo | ⭐⭐⭐⭐ | Good | Email | Frontend Only |
| Render | Free-$100/mo | ⭐⭐⭐⭐ | Good | Docs | Side Projects |

## Recommended: Railway (Easiest)

### Why Railway?
- ✅ Click-deploy from GitHub
- ✅ Free tier available ($5 credit)
- ✅ MySQL included
- ✅ Auto-deploys on git push
- ✅ Custom domains
- ✅ Environment variables easy to manage

### Step-by-Step Deployment

```bash
# 1. Go to https://railway.app
# 2. Click "Create New Project"
# 3. Select "Deploy from GitHub repo"
# 4. Authorize GitHub
# 5. Select your ecommerce-platform repo

# 6. Railway auto-detects services
# 7. Add MySQL plugin
# 8. Set environment variables

# 9. Deploy!
# Your backend will be at: https://yourdomain-production.up.railway.app
```

### Environment Variables in Railway

```
NODE_ENV=production
PORT=5000
DB_HOST=mysql
JWT_SECRET=your_production_secret
STRIPE_SECRET_KEY=your_stripe_key
# ... others
```

## Alternative: DigitalOcean (Production Grade)

### Create Droplet

```bash
# 1. Create account: https://www.digitalocean.com
# 2. Create Droplet:
#    - Ubuntu 22.04 LTS
#    - Basic: $5/month
#    - Enable Docker from app marketplace

# 3. Get IP address and SSH in:
ssh root@your_droplet_ip

# 4. Clone your repo:
git clone https://github.com/yourusername/ecommerce-platform.git
cd ecommerce-platform

# 5. Create .env:
cp .env.example .env
nano .env  # Edit settings

# 6. Start with docker-compose:
docker-compose up -d

# 7. Point domain DNS to droplet IP
# 8. Done!
```

### Setup Domain (DigitalOcean)

```bash
# 1. Buy domain from registrar
# 2. Add to DigitalOcean:
#    - Go to Networking → Domains
#    - Create basic record:
#      A    @      your_droplet_ip
#      A    www    your_droplet_ip

# 3. Update in application:
#    CLIENT_URL=https://yourdomain.com
#    VITE_API_URL=https://yourdomain.com/api

# 4. Setup SSL (Let's Encrypt):
docker-compose exec frontend certbot certonly --standalone -d yourdomain.com
```

## Alternative: Render (Generous Free Tier)

### Deploy to Render

```bash
# 1. Go to https://render.com
# 2. Sign up with GitHub
# 3. Create New Web Service
# 4. Connect GitHub repo
# 5. Configuration:
#    - Runtime: Node
#    - Build: npm install
#    - Start: npm run dev
# 6. Add Database (PostgreSQL)
# 7. Set Environment Variables
# 8. Deploy!
```

## Alternative: AWS (Scalable)

### Using AWS Elastic Beanstalk

```bash
# Install AWS CLI and EB CLI
npm install -g @aws-amplify/cli

# Initialize project
eb init ecommerce-platform --platform node.js

# Create environment
eb create ecommerce-env

# Deploy application
eb deploy

# Open in browser
eb open
```

### RDS for Database

```bash
# AWS Console → RDS → Create Database
# - Engine: MySQL 8.0
# - Instance: db.t3.micro (free tier)
# - Set master username and password
# - Multi-AZ: No (for cost)
# - Publicly accessible: No

# Get endpoint and update .env:
DB_HOST=your-rds-endpoint.amazonaws.com
DB_PORT=3306
```

## Alternative: Vercel (Frontend Only)

Great for hosting just the frontend:

```bash
# 1. Install Vercel CLI
npm i -g vercel

# 2. Deploy
vercel

# 3. Set environment variables:
vercel env add VITE_API_URL
# Enter your backend URL

# 4. Redeploy
vercel --prod
```

## Heroku (Legacy but Reliable)

```bash
# Create account and install Heroku CLI
npm install -g heroku

# Login
heroku login

# Create apps
heroku create ecommerce-backend
heroku create ecommerce-frontend

# Add database
heroku addons:create cleardb:ignite -a ecommerce-backend

# Set config
heroku config:set JWT_SECRET=secret -a ecommerce-backend

# Deploy
git push heroku main
```

## Hosting Checklist

Before deploying to production:

- [ ] Create `.env.production` with production values
- [ ] Set strong JWT_SECRET
- [ ] Configured payment gateway credentials
- [ ] Database backups enabled
- [ ] HTTPS/SSL certificate installed
- [ ] Environment variables secured
- [ ] Database migrations run
- [ ] Logs configured
- [ ] Monitoring setup
- [ ] Backup strategy planned
- [ ] CI/CD pipeline configured
- [ ] Domain DNS configured

## Cost Estimation (Monthly)

### Minimal Setup
- Railway: $5-10/month
- *Or* DigitalOcean: $5/month

### Recommended Setup
- DigitalOcean Droplet: $12/month
- DigitalOcean Managed MySQL: Free (included)
- Domain: $12/year
- **Total: ~$12/month**

### Enterprise Setup
- AWS EC2: $20+/month
- AWS RDS: $50+/month
- CloudFront CDN: $0.085/GB
- Backup/Storage: $10+/month
- **Total: $80+/month**

## Monitoring & Uptime

### Uptime Monitoring

```bash
# Free options:
# - Uptime Robot: Monitors every 5 minutes
# - Better Uptime: More features, free tier
# - Pingdom: Enterprise monitoring
```

### Application Monitoring

```bash
# Sentry (Error tracking)
npm install @sentry/node @sentry/tracing

# LogRocket (Session Replay)
npm install logrocket

# New Relic (Performance)
npm install newrelic
```

## Backup Strategy

### Automated Backups

```bash
# Daily MySQL backup
0 2 * * * docker-compose exec mysql mysqldump -u root -p${DB_PASSWORD} --all-databases > /backups/mysql-$(date +\%Y\%m\%d).sql

# Store in cloud (AWS S3, Google Cloud)
aws s3 cp /backups/mysql-*.sql s3://my-backups/
```

### Database Export

```bash
# Export from DigitalOcean managed database
mysqldump -h your-db-host -u your-user -p ecommerce > backup.sql

# Import on new server
mysql -h new-db-host -u new-user -p ecommerce < backup.sql
```

## Performance Optimization

### CDN Setup

```bash
# Use Cloudflare (free):
# 1. Point domain nameservers to Cloudflare
# 2. Enable caching
# 3. Setup auto-minification
# 4. Enable GZIP compression
```

### Database Optimization

```sql
-- Add indexes
CREATE INDEX idx_user_email ON users(email);
CREATE INDEX idx_product_category ON products(category);
CREATE INDEX idx_order_user ON orders(user_id);

-- Optimize queries
ANALYZE TABLE users;
OPTIMIZE TABLE products;
```

## SSL/HTTPS Setup

### Free SSL with Let's Encrypt

```bash
# Using Certbot
sudo apt-get install certbot python3-certbot-nginx

# Get certificate
sudo certbot certonly --standalone -d yourdomain.com -d www.yourdomain.com

# Auto-renew
sudo certbot renew --dry-run
```

### Configure Nginx for HTTPS

```nginx
server {
    listen 443 ssl http2;
    server_name yourdomain.com;

    ssl_certificate /etc/letsencrypt/live/yourdomain.com/fullchain.pem;
    ssl_certificate_key /etc/letsencrypt/live/yourdomain.com/privkey.pem;

    # Your configuration
}

# Redirect HTTP to HTTPS
server {
    listen 80;
    server_name yourdomain.com;
    return 301 https://$server_name$request_uri;
}
```

## Troubleshooting Deployments

### Application Won't Start

```bash
# Check logs
docker-compose logs backend -f

# Common issues:
# - Port already in use
# - Environment variables missing
# - Database not accessible
# - Dependency installation failed
```

### Database Connection Issues

```bash
# Test connection
mysql -h db-host -u username -p database_name

# Check firewall
nc -zv db-host 3306

# Verify credentials in .env
```

### Memory Issues

```bash
# Check memory usage
docker stats

# Increase if needed:
# - Droplet: Resize up
# - Railway: Increase memory
# - AWS: Choose larger instance
```

## Resources

- [Railway Docs](https://docs.railway.app)
- [DigitalOcean Docs](https://docs.digitalocean.com)
- [AWS Documentation](https://docs.aws.amazon.com)
- [Render Docs](https://render.com/docs)
- [Heroku Docs](https://devcenter.heroku.com)
