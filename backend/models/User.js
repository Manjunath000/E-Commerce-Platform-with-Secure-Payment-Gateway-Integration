const db = require('../config/database');
const bcrypt = require('bcryptjs');

class User {
  // Create a new user
  static async create(userData) {
    const { email, password, first_name, last_name, phone } = userData;
    const password_hash = await bcrypt.hash(password, 10);
    
    const [result] = await db.query(
      'INSERT INTO users (email, password_hash, first_name, last_name, phone) VALUES (?, ?, ?, ?, ?)',
      [email, password_hash, first_name, last_name, phone]
    );
    
    return result.insertId;
  }

  // Find user by email
  static async findByEmail(email) {
    const [rows] = await db.query('SELECT * FROM users WHERE email = ?', [email]);
    return rows[0];
  }

  // Find user by ID
  static async findById(id) {
    const [rows] = await db.query('SELECT id, email, first_name, last_name, phone, created_at FROM users WHERE id = ?', [id]);
    return rows[0];
  }

  // Update user
  static async update(id, userData) {
    const { first_name, last_name, phone } = userData;
    await db.query(
      'UPDATE users SET first_name = ?, last_name = ?, phone = ? WHERE id = ?',
      [first_name, last_name, phone, id]
    );
    return this.findById(id);
  }

  // Verify password
  static async verifyPassword(plainPassword, hashedPassword) {
    return await bcrypt.compare(plainPassword, hashedPassword);
  }

  // Delete user
  static async delete(id) {
    await db.query('DELETE FROM users WHERE id = ?', [id]);
  }

  // Get all users (admin)
  static async findAll(limit = 50, offset = 0) {
    const [rows] = await db.query(
      'SELECT id, email, first_name, last_name, phone, created_at FROM users LIMIT ? OFFSET ?',
      [limit, offset]
    );
    return rows;
  }
}

module.exports = User;
