# QUICK START GUIDE

## 🚀 Get Started in 5 Minutes

### Prerequisites
- Node.js (v18+)
- Docker & Docker Compose
- Git
- GitHub account

---

## Step 1: Clone & Setup (1 min)

```bash
# Clone repository
git clone https://github.com/yourusername/ecommerce-platform.git
cd ecommerce-platform

# Copy environment template
cp .env.example .env
```

---

## Step 2: Start with Docker Compose (2 min)

```bash
# Start all services (MySQL, Backend, Frontend)
docker-compose up -d

# Verify services running
docker-compose ps
```

**Access:**
- 🌐 Frontend: http://localhost
- 🔧 Backend: http://localhost:5000
- 📊 phpMyAdmin: http://localhost:8080
- 📚 API Health: http://localhost:5000/health

---

## Step 3: Initialize Database (1 min)

```bash
# Run migrations
docker-compose exec -T mysql mysql -u ecommerce -pecommerce123 ecommerce < database/migrations/001_create_users.sql
docker-compose exec -T mysql mysql -u ecommerce -pecommerce123 ecommerce < database/migrations/002_create_products.sql
docker-compose exec -T mysql mysql -u ecommerce -pecommerce123 ecommerce < database/migrations/003_create_orders.sql
docker-compose exec -T mysql mysql -u ecommerce -pecommerce123 ecommerce < database/migrations/004_create_payments.sql

# Seed sample data
docker-compose exec -T mysql mysql -u ecommerce -pecommerce123 ecommerce < database/seeds/initialData.sql
```

---

## Step 4: Update Configuration (1 min)

Edit `.env` file:

```env
# Payment Gateways
STRIPE_SECRET_KEY=sk_test_your_key_here
PAYPAL_CLIENT_ID=your_client_id_here

# JWT
JWT_SECRET=change_this_to_something_secure

# Domain (after deployment)
CLIENT_URL=http://localhost:3000
```

---

## 🎉 You're Ready!

| Service | URL | Status |
|---------|-----|--------|
| Frontend | http://localhost | ✅ Active |
| Backend API | http://localhost:5000 | ✅ Active |
| Database | localhost:3306 | ✅ Active |
| phpMyAdmin | http://localhost:8080 | ✅ Active |

---

## 📝 Project Features

✅ **Responsive Design**
- Mobile-first CSS
- Works on all devices
- Touch-friendly interface

✅ **Payment Integration**
- Stripe checkout
- PayPal support
- Secure transactions

✅ **Full Stack**
- React frontend
- Node.js backend
- MySQL database

✅ **Docker Ready**
- One-command setup
- Production-ready
- Easy scaling

✅ **CI/CD Pipeline**
- GitHub Actions
- Automated tests
- Auto-deployment

---

## 🛠️ Common Tasks

### View Logs
```bash
docker-compose logs backend -f      # Backend logs
docker-compose logs -f              # All services
```

### Run Backend Tests
```bash
docker-compose exec backend npm test
```

### Build Frontend for Production
```bash
docker-compose exec frontend npm run build
```

### Access Database
```bash
docker-compose exec mysql mysql -u ecommerce -pecommerce123 ecommerce
```

### Stop All Services
```bash
docker-compose down
```

### Rebuild Everything
```bash
docker-compose down
docker-compose up --build -d
```

---

## 📚 Documentation

| Document | Purpose |
|----------|---------|
| [SETUP.md](./docs/SETUP.md) | Detailed setup guide |
| [API.md](./docs/API.md) | API endpoints reference |
| [DOCKER_DEPLOYMENT.md](./docs/DOCKER_DEPLOYMENT.md) | Docker guide |
| [GITHUB_DEPLOYMENT.md](./docs/GITHUB_DEPLOYMENT.md) | GitHub & deployment |
| [PAYMENT_GATEWAY.md](./docs/PAYMENT_GATEWAY.md) | Stripe/PayPal setup |
| [SECURITY.md](./docs/SECURITY.md) | Security best practices |

---

## 🚀 Deploy to Production

### Option 1: Railway (Easiest - 5 minutes)

1. Go to [railway.app](https://railway.app)
2. Click "Deploy from GitHub"
3. Select your repository
4. Railway auto-configures everything!
5. Set environment variables
6. Deploy!

**Cost:** Free tier ($5 credit) + $5-20/month

### Option 2: DigitalOcean VPS

```bash
# Create $5/month droplet with Docker pre-installed
# SSH into droplet
ssh root@your_droplet_ip

# Clone and deploy
git clone https://github.com/yourusername/ecommerce-platform.git
cd ecommerce-platform
docker-compose up -d

# Point domain DNS to droplet IP
# Done!
```

**Cost:** $5/month

See [DEPLOYMENT_HOSTING.md](./docs/DEPLOYMENT_HOSTING.md) for more options.

---

## 🔐 Security Quick Tips

1. **Change JWT_SECRET** in `.env`
   ```env
   JWT_SECRET=your_super_secret_key_minimum_32_chars
   ```

2. **Never commit .env** - Already in .gitignore ✅

3. **Use HTTPS** in production

4. **Strong Database Password**
   ```env
   DB_PASSWORD=complex_password_here_123!@#
   ```

5. **Payment Keys** - Use test keys first!
   ```env
   STRIPE_SECRET_KEY=sk_test_... (testing)
   STRIPE_SECRET_KEY=sk_live_... (production)
   ```

---

## 📲 Test Payment Processing

### Stripe Test Card
- Card: `4242 4242 4242 4242`
- Exp: `12/25`
- CVC: `123`

### PayPal Sandbox
Use sandbox account from PayPal Developer Dashboard

---

## ❓ Troubleshooting

### Port Already in Use
```bash
# Change ports in .env
FRONTEND_PORT=3001
PORT=5001
```

### Services Won't Start
```bash
# Check logs
docker-compose logs

# Rebuild
docker-compose down
docker-compose up --build -d
```

### Database Connection Failed
```bash
# Verify MySQL is running
docker-compose exec mysql ping

# Check credentials in .env
```

### API Response 500
```bash
# Check backend logs
docker-compose logs backend

# Ensure database migrations ran
```

---

## 📊 Project Structure

```
ecommerce-platform/
├── frontend/           # React application
│   ├── src/
│   │   ├── components/
│   │   ├── pages/
│   │   ├── services/
│   │   └── styles/
│   └── package.json
├── backend/            # Node.js API
│   ├── routes/
│   ├── controllers/
│   ├── middleware/
│   ├── models/
│   └── server.js
├── database/           # SQL files
│   ├── migrations/
│   └── seeds/
├── docs/              # Documentation
├── docker-compose.yml # Multi-container setup
├── Dockerfile.*       # Container configs
└── .github/workflows/ # CI/CD pipelines
```

---

## 🚀 Next Steps

1. **Customize** - Update styles and branding
2. **Add Features** - More products, categories, etc.
3. **Payment Setup** - Add real Stripe/PayPal keys
4. **Deploy** - Push to GitHub and deploy
5. **Monitor** - Setup error tracking (Sentry, etc.)
6. **Scale** - Add caching, CDN, monitoring

---

## 💡 Pro Tips

- **Frontend Development**: Run `npm run dev` in frontend folder for hot reload
- **API Testing**: Use Postman/Thunder Client with endpoints in [API.md](./docs/API.md)
- **Database Management**: Use phpMyAdmin at http://localhost:8080
- **Logs**: Always check logs first when debugging
- **Performance**: Test on mobile early and often

---

## 🤝 Contributing

1. Create feature branch: `git checkout -b feature/amazing`
2. Commit changes: `git commit -m "feat: add amazing feature"`
3. Push branch: `git push origin feature/amazing`
4. Create Pull Request on GitHub

---

## 📞 Support

- 📖 **Docs**: See `/docs` folder
- 🐛 **Bugs**: Open issue on GitHub
- 💬 **Questions**: Check troubleshooting section
- 📧 **Email**: support@example.com

---

## 📄 License

ISC License - See LICENSE file

---

**Happy coding! 🎉**

**Last Updated**: June 2026
**Status**: ✅ Production Ready
