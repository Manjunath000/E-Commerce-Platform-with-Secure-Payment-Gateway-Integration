const db = require('../config/database');
const { v4: uuidv4 } = require('uuid');

class Order {
  // Create a new order
  static async create(orderData) {
    const { user_id, total_amount, shipping_address, items } = orderData;
    const order_number = `ORD-${Date.now()}-${uuidv4().slice(0, 8).toUpperCase()}`;
    
    const connection = await db.getConnection();
    
    try {
      await connection.beginTransaction();
      
      // Insert order
      const [result] = await connection.query(
        'INSERT INTO orders (user_id, order_number, total_amount, status, shipping_address) VALUES (?, ?, ?, ?, ?)',
        [user_id, order_number, total_amount, 'pending', shipping_address]
      );
      
      const orderId = result.insertId;
      
      // Insert order items
      if (items && items.length > 0) {
        for (const item of items) {
          await connection.query(
            'INSERT INTO order_items (order_id, product_id, quantity, price) VALUES (?, ?, ?, ?)',
            [orderId, item.product_id, item.quantity, item.price]
          );
          
          // Update product stock
          await connection.query(
            'UPDATE products SET stock_quantity = stock_quantity - ? WHERE id = ?',
            [item.quantity, item.product_id]
          );
        }
      }
      
      await connection.commit();
      return orderId;
    } catch (error) {
      await connection.rollback();
      throw error;
    } finally {
      connection.release();
    }
  }

  // Find order by ID
  static async findById(id) {
    const [rows] = await db.query(`
      SELECT o.*, u.email, u.first_name, u.last_name 
      FROM orders o 
      LEFT JOIN users u ON o.user_id = u.id 
      WHERE o.id = ?
    `, [id]);
    
    if (rows[0]) {
      // Get order items
      const [items] = await db.query(`
        SELECT oi.*, p.name, p.image_url 
        FROM order_items oi 
        LEFT JOIN products p ON oi.product_id = p.id 
        WHERE oi.order_id = ?
      `, [id]);
      
      rows[0].items = items;
    }
    
    return rows[0];
  }

  // Find order by order number
  static async findByOrderNumber(order_number) {
    const [rows] = await db.query('SELECT * FROM orders WHERE order_number = ?', [order_number]);
    return rows[0];
  }

  // Get user orders
  static async findByUserId(user_id, limit = 50, offset = 0) {
    const [rows] = await db.query(`
      SELECT * FROM orders 
      WHERE user_id = ? 
      ORDER BY created_at DESC 
      LIMIT ? OFFSET ?
    `, [user_id, limit, offset]);
    
    return rows;
  }

  // Update order status
  static async updateStatus(id, status) {
    await db.query('UPDATE orders SET status = ? WHERE id = ?', [status, id]);
    return this.findById(id);
  }

  // Get all orders (admin)
  static async findAll(filters = {}) {
    let query = `
      SELECT o.*, u.email, u.first_name, u.last_name 
      FROM orders o 
      LEFT JOIN users u ON o.user_id = u.id 
      WHERE 1=1
    `;
    const params = [];

    if (filters.status) {
      query += ' AND o.status = ?';
      params.push(filters.status);
    }

    if (filters.user_id) {
      query += ' AND o.user_id = ?';
      params.push(filters.user_id);
    }

    query += ' ORDER BY o.created_at DESC LIMIT ? OFFSET ?';
    params.push(filters.limit || 50, filters.offset || 0);

    const [rows] = await db.query(query, params);
    return rows;
  }

  // Delete order
  static async delete(id) {
    const connection = await db.getConnection();
    
    try {
      await connection.beginTransaction();
      
      // Delete order items
      await connection.query('DELETE FROM order_items WHERE order_id = ?', [id]);
      
      // Delete order
      await connection.query('DELETE FROM orders WHERE id = ?', [id]);
      
      await connection.commit();
    } catch (error) {
      await connection.rollback();
      throw error;
    } finally {
      connection.release();
    }
  }
}

module.exports = Order;
