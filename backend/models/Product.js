const db = require('../config/database');

class Product {
  // Create a new product
  static async create(productData) {
    const { name, description, price, stock_quantity, image_url, category } = productData;
    
    const [result] = await db.query(
      'INSERT INTO products (name, description, price, stock_quantity, image_url, category) VALUES (?, ?, ?, ?, ?, ?)',
      [name, description, price, stock_quantity, image_url, category]
    );
    
    return result.insertId;
  }

  // Find product by ID
  static async findById(id) {
    const [rows] = await db.query('SELECT * FROM products WHERE id = ?', [id]);
    return rows[0];
  }

  // Get all products with filters
  static async findAll(filters = {}) {
    let query = 'SELECT * FROM products WHERE 1=1';
    const params = [];

    if (filters.category) {
      query += ' AND category = ?';
      params.push(filters.category);
    }

    if (filters.minPrice) {
      query += ' AND price >= ?';
      params.push(filters.minPrice);
    }

    if (filters.maxPrice) {
      query += ' AND price <= ?';
      params.push(filters.maxPrice);
    }

    if (filters.search) {
      query += ' AND (name LIKE ? OR description LIKE ?)';
      params.push(`%${filters.search}%`, `%${filters.search}%`);
    }

    query += ' ORDER BY created_at DESC LIMIT ? OFFSET ?';
    params.push(filters.limit || 50, filters.offset || 0);

    const [rows] = await db.query(query, params);
    return rows;
  }

  // Update product
  static async update(id, productData) {
    const { name, description, price, stock_quantity, image_url, category } = productData;
    
    await db.query(
      'UPDATE products SET name = ?, description = ?, price = ?, stock_quantity = ?, image_url = ?, category = ? WHERE id = ?',
      [name, description, price, stock_quantity, image_url, category, id]
    );
    
    return this.findById(id);
  }

  // Update stock
  static async updateStock(id, quantity) {
    await db.query(
      'UPDATE products SET stock_quantity = stock_quantity + ? WHERE id = ?',
      [quantity, id]
    );
    return this.findById(id);
  }

  // Delete product
  static async delete(id) {
    await db.query('DELETE FROM products WHERE id = ?', [id]);
  }

  // Get categories
  static async getCategories() {
    const [rows] = await db.query('SELECT DISTINCT category FROM products WHERE category IS NOT NULL');
    return rows.map(row => row.category);
  }

  // Check stock availability
  static async checkStock(id, quantity) {
    const product = await this.findById(id);
    return product && product.stock_quantity >= quantity;
  }
}

module.exports = Product;
