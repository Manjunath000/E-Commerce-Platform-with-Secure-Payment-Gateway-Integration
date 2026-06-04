# Changelog

All notable changes to this project will be documented in this file.

## [2.0.0] - ${new Date().toISOString().split('T')[0]}

### 🚨 CRITICAL SECURITY FIXES

- **[SECURITY]** Fixed exposed GitHub personal access token in git remote
- **[SECURITY]** Removed credentials from git configuration
- **[SECURITY]** Added SECURITY_WARNING.md with remediation steps

### ✨ New Features

- **[FEATURE]** Added complete MySQL database models (User, Product, Order, Payment)
- **[FEATURE]** Created Docker containerization setup
- **[FEATURE]** Added Docker Compose for multi-container orchestration
- **[FEATURE]** Implemented CI/CD pipeline with GitHub Actions
- **[FEATURE]** Added visual Hero component with animated graphics
- **[FEATURE]** Created comprehensive global CSS with modern design system
- **[FEATURE]** Added order_items table for better data normalization

### 🔧 Configuration Changes

- **[CONFIG]** Migrated from MongoDB to MySQL
- **[CONFIG]** Updated environment variables for MySQL connection
- **[CONFIG]** Added connection pooling for database
- **[CONFIG]** Configured CORS with environment-based origins
- **[CONFIG]** Added health check endpoints with database connectivity test

### 📦 Dependencies

- **[ADD]** mysql2 ^3.6.0 - MySQL driver
- **[ADD]** multer ^1.4.5 - File upload handling
- **[ADD]** uuid ^9.0.0 - Unique identifier generation
- **[REMOVE]** mongoose ^7.0.0 - Replaced with MySQL

### 🐳 Docker & DevOps

- **[ADD]** Dockerfile for backend with security hardening
- **[ADD]** Dockerfile for frontend with multi-stage build
- **[ADD]** docker-compose.yml with MySQL, phpMyAdmin, backend, and frontend
- **[ADD]** nginx.conf with optimized configuration
- **[ADD]** .dockerignore for optimized builds
- **[ADD]** GitHub Actions workflow for CI/CD
- **[ADD]** Automated security scanning with Trivy

### 💻 Backend Improvements

- **[IMPROVE]** Enhanced server.js with better error handling
- **[IMPROVE]** Added request logging middleware
- **[IMPROVE]** Implemented 404 handler
- **[IMPROVE]** Added development-only stack traces
- **[IMPROVE]** Database connection testing and logging

### 🎨 Frontend Improvements

- **[ADD]** Hero component with animated shapes and gradient backgrounds
- **[ADD]** Global CSS with CSS variables for theming
- **[ADD]** Dark mode support via prefers-color-scheme
- **[ADD]** Responsive grid system
- **[ADD]** Modern button styles with hover effects
- **[ADD]** Card components with hover animations
- **[ADD]** Form components with validation styles
- **[ADD]** Badge and alert components
- **[ADD]** Loading spinner component
- **[ADD]** Accessibility improvements (sr-only, focus-visible)
- **[ADD]** Animation keyframes (fadeIn, slideIn, float, pulse)

### 📝 Documentation

- **[ADD]** SECURITY_WARNING.md - Critical security guide
- **[ADD]** CHANGELOG.md - This file
- **[UPDATE]** .env.example files with correct MySQL configuration

### 🗃️ Database

- **[ADD]** 005_create_order_items.sql migration
- **[ADD]** User model with password hashing
- **[ADD]** Product model with advanced filtering
- **[ADD]** Order model with transaction support
- **[ADD]** Payment model with JSON details storage
- **[ADD]** Database connection pooling
- **[ADD]** Foreign key constraints and indexes

### 🔄 Breaking Changes

- **[BREAKING]** Changed database from MongoDB to MySQL
  - Migration required for existing data
  - Environment variables changed (MONGODB_URI → DB_HOST, DB_USER, etc.)
- **[BREAKING]** Updated package.json dependencies
  - Remove mongoose, install mysql2
  - Run `npm install` in backend directory

---

## [1.0.0] - Previous Version

### Initial Release

- Basic Express.js backend structure
- React frontend with Vite
- MongoDB configuration (deprecated)
- Stripe and PayPal integration
- Authentication routes
- Product, Order, Payment controllers
- Basic documentation

---

## Migration Guide: 1.0.0 → 2.0.0

### Backend Migration

1. **Install new dependencies:**
   ```bash
   cd backend
   npm install
   ```

2. **Update .env file:**
   ```env
   # Remove:
   MONGODB_URI=mongodb://localhost:27017/ecommerce

   # Add:
   DB_HOST=localhost
   DB_PORT=3306
   DB_USER=ecommerce
   DB_PASSWORD=ecommerce123
   DB_NAME=ecommerce
   ```

3. **Run database migrations:**
   ```bash
   # Start MySQL
   docker-compose up -d mysql

   # Run migrations
   docker-compose exec mysql mysql -u ecommerce -pecommerce123 ecommerce < database/migrations/001_create_users.sql
   docker-compose exec mysql mysql -u ecommerce -pecommerce123 ecommerce < database/migrations/002_create_products.sql
   docker-compose exec mysql mysql -u ecommerce -pecommerce123 ecommerce < database/migrations/003_create_orders.sql
   docker-compose exec mysql mysql -u ecommerce -pecommerce123 ecommerce < database/migrations/004_create_payments.sql
   docker-compose exec mysql mysql -u ecommerce -pecommerce123 ecommerce < database/migrations/005_create_order_items.sql
   ```

### Data Migration (If you have existing data)

1. Export data from MongoDB
2. Transform to MySQL format
3. Import using SQL INSERT statements

---

## Security Advisories

### Version 1.0.0
- 🔴 **CRITICAL**: Exposed GitHub credentials in git remote URL
  - **Fix**: Upgrade to 2.0.0 and follow SECURITY_WARNING.md

---

## Upcoming Features (Roadmap)

- [ ] User profile page
- [ ] Product reviews and ratings
- [ ] Wishlist functionality
- [ ] Order tracking
- [ ] Email notifications
- [ ] Admin dashboard
- [ ] Analytics integration
- [ ] Multi-language support
- [ ] Product recommendations
- [ ] Social media integration
- [ ] Advanced search filters
- [ ] Inventory management
- [ ] Discount codes/coupons
- [ ] Shipping integration
- [ ] Tax calculation

---

## Contributors

- Initial development team
- Security improvements: Automated fix on ${new Date().toISOString().split('T')[0]}

---

## License

ISC License - See LICENSE file for details
