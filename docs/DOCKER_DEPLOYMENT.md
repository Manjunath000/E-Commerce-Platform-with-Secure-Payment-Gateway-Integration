# Docker Deployment Guide

## Prerequisites

- Docker (v20.10+)
- Docker Compose (v2.0+)
- Git

## Local Development with Docker

### 1. Clone Repository

```bash
git clone https://github.com/yourusername/ecommerce-platform.git
cd ecommerce-platform
```

### 2. Setup Environment Variables

```bash
cp .env.example .env
```

Edit `.env` with your configuration:
```env
NODE_ENV=development
PORT=5000
STRIPE_SECRET_KEY=your_stripe_secret
PAYPAL_CLIENT_ID=your_paypal_client_id
# ... other variables
```

### 3. Start All Services with Docker Compose

```bash
docker-compose up -d
```

This starts:
- **Backend** (5000): http://localhost:5000
- **Frontend** (80): http://localhost
- **MySQL** (3306): localhost
- **phpMyAdmin** (8080): http://localhost:8080

### 4. Initialize Database

```bash
# Run migrations
docker-compose exec -T mysql mysql -u ecommerce -pecommerce123 ecommerce < database/migrations/001_create_users.sql
docker-compose exec -T mysql mysql -u ecommerce -pecommerce123 ecommerce < database/migrations/002_create_products.sql
docker-compose exec -T mysql mysql -u ecommerce -pecommerce123 ecommerce < database/migrations/003_create_orders.sql
docker-compose exec -T mysql mysql -u ecommerce -pecommerce123 ecommerce < database/migrations/004_create_payments.sql

# Seed data
docker-compose exec -T mysql mysql -u ecommerce -pecommerce123 ecommerce < database/seeds/initialData.sql
```

### 5. Verify Services Health

```bash
docker-compose ps
```

### 6. View Logs

```bash
# All services
docker-compose logs -f

# Specific service
docker-compose logs -f backend
docker-compose logs -f frontend
docker-compose logs -f mysql
```

## Common Commands

### Stop Services
```bash
docker-compose down
```

### Rebuild Images
```bash
docker-compose up -d --build
```

### Execute Commands in Container
```bash
# Backend
docker-compose exec backend npm test

# Frontend
docker-compose exec frontend npm run build

# MySQL
docker-compose exec mysql mysql -u ecommerce -pecommerce123 ecommerce -e "SHOW TABLES;"
```

### View Resource Usage
```bash
docker stats
```

## Production Deployment

### 1. Build Images

```bash
# Backend
docker build -f Dockerfile.backend -t ecommerce-backend:1.0.0 .

# Frontend
docker build -f Dockerfile.frontend -t ecommerce-frontend:1.0.0 .
```

### 2. Push to Docker Registry

```bash
# Login to your registry (Docker Hub, ghcr.io, etc.)
docker login

# Tag images
docker tag ecommerce-backend:1.0.0 yourusername/ecommerce-backend:1.0.0
docker tag ecommerce-frontend:1.0.0 yourusername/ecommerce-frontend:1.0.0

# Push images
docker push yourusername/ecommerce-backend:1.0.0
docker push yourusername/ecommerce-frontend:1.0.0
```

### 3. Deploy with Docker Compose (Production)

Create `docker-compose.prod.yml`:

```yaml
version: '3.8'

services:
  mysql:
    image: mysql:8.0
    environment:
      MYSQL_ROOT_PASSWORD: ${DB_ROOT_PASSWORD}
      MYSQL_DATABASE: ${DB_NAME}
      MYSQL_USER: ${DB_USER}
      MYSQL_PASSWORD: ${DB_PASSWORD}
    volumes:
      - mysql_data:/var/lib/mysql
    networks:
      - ecommerce-network
    restart: always

  backend:
    image: yourusername/ecommerce-backend:1.0.0
    environment:
      NODE_ENV: production
      # ... all environment variables
    ports:
      - "5000:5000"
    depends_on:
      - mysql
    networks:
      - ecommerce-network
    restart: always

  frontend:
    image: yourusername/ecommerce-frontend:1.0.0
    ports:
      - "80:80"
    depends_on:
      - backend
    networks:
      - ecommerce-network
    restart: always

volumes:
  mysql_data:

networks:
  ecommerce-network:
```

Deploy:
```bash
docker-compose -f docker-compose.prod.yml up -d
```

## Docker Image Optimization

### Backend Image Size
- Uses Alpine Linux for smaller footprint
- Installs only production dependencies
- Multi-stage build (if applicable)

### Frontend Image Size
- Multi-stage build: Build stage removes node_modules after build
- Nginx Alpine for production serving
- Only dist folder served

## Security Best Practices

1. **Never commit .env files**
   - Use .env.example as template
   - Add .env to .gitignore

2. **Use secrets for sensitive data**
   - Docker Compose: Use external .env file
   - Kubernetes/Docker Swarm: Use secrets

3. **Non-root user** (add to Dockerfile if needed)
   ```dockerfile
   RUN addgroup -g 1000 appuser && \
       adduser -D -u 1000 -G appuser appuser
   USER appuser
   ```

4. **Security headers in nginx.conf**
   - X-Frame-Options
   - X-Content-Type-Options
   - Content-Security-Policy

5. **Network isolation**
   - Services communicate via docker network
   - Only necessary ports exposed

## Troubleshooting

### Port Already in Use
```bash
# Change port in .env
PORT=5001

# Or kill process using port
lsof -i :5000
kill -9 <PID>
```

### Database Connection Failed
```bash
# Check MySQL is healthy
docker-compose exec mysql mysql -u ecommerce -pecommerce123 -e "SHOW DATABASES;"

# Check network
docker-compose exec backend ping mysql
```

### Frontend can't reach Backend API
```bash
# Verify proxy in nginx.conf
# Check VITE_API_URL in environment

# Test from frontend container
docker-compose exec frontend curl http://backend:5000/health
```

### Out of Memory
```bash
# Increase Docker memory limits in Docker Desktop settings
# Or use resource limits in docker-compose
services:
  backend:
    deploy:
      resources:
        limits:
          memory: 512M
        reservations:
          memory: 256M
```

## Monitoring

### View CPU/Memory Usage
```bash
docker stats
```

### View All Logs
```bash
docker-compose logs --tail 100 -f
```

### Health Checks
Services include health checks. View status:
```bash
docker-compose ps
```

## Scaling

### Scale Backend Service
```bash
docker-compose up -d --scale backend=3
```

Note: Requires load balancer configuration in nginx

## Environment Variables for Docker

Key variables to set in `.env`:

```env
# Core
NODE_ENV=production
PORT=5000

# Database
DB_HOST=mysql
DB_PORT=3306
DB_NAME=ecommerce
DB_USER=ecommerce
DB_PASSWORD=secure_password_here

# JWT
JWT_SECRET=your_super_secret_key

# Payment Gateways
STRIPE_SECRET_KEY=your_stripe_key
PAYPAL_CLIENT_ID=your_paypal_id

# Client
CLIENT_URL=https://yourdomain.com
VITE_API_URL=https://yourdomain.com/api
```

## Next Steps

1. Set up GitHub Container Registry
2. Configure automated deployments
3. Set up monitoring and logging
4. Configure SSL certificates
5. Set up backup strategy for database
6. Configure CDN for static assets
