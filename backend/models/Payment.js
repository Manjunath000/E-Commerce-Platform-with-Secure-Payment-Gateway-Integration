const db = require('../config/database');

class Payment {
  // Create a new payment
  static async create(paymentData) {
    const { 
      order_id, 
      payment_method, 
      transaction_id, 
      amount, 
      currency, 
      status,
      payment_details 
    } = paymentData;
    
    const [result] = await db.query(
      `INSERT INTO payments 
       (order_id, payment_method, transaction_id, amount, currency, status, payment_details) 
       VALUES (?, ?, ?, ?, ?, ?, ?)`,
      [order_id, payment_method, transaction_id, amount, currency || 'USD', status, JSON.stringify(payment_details)]
    );
    
    return result.insertId;
  }

  // Find payment by ID
  static async findById(id) {
    const [rows] = await db.query('SELECT * FROM payments WHERE id = ?', [id]);
    if (rows[0] && rows[0].payment_details) {
      rows[0].payment_details = JSON.parse(rows[0].payment_details);
    }
    return rows[0];
  }

  // Find payment by transaction ID
  static async findByTransactionId(transaction_id) {
    const [rows] = await db.query('SELECT * FROM payments WHERE transaction_id = ?', [transaction_id]);
    if (rows[0] && rows[0].payment_details) {
      rows[0].payment_details = JSON.parse(rows[0].payment_details);
    }
    return rows[0];
  }

  // Find payments by order ID
  static async findByOrderId(order_id) {
    const [rows] = await db.query('SELECT * FROM payments WHERE order_id = ?', [order_id]);
    return rows.map(row => {
      if (row.payment_details) {
        row.payment_details = JSON.parse(row.payment_details);
      }
      return row;
    });
  }

  // Update payment status
  static async updateStatus(id, status, payment_details = null) {
    if (payment_details) {
      await db.query(
        'UPDATE payments SET status = ?, payment_details = ? WHERE id = ?',
        [status, JSON.stringify(payment_details), id]
      );
    } else {
      await db.query('UPDATE payments SET status = ? WHERE id = ?', [status, id]);
    }
    return this.findById(id);
  }

  // Get all payments (admin)
  static async findAll(filters = {}) {
    let query = `
      SELECT p.*, o.order_number, u.email 
      FROM payments p 
      LEFT JOIN orders o ON p.order_id = o.id 
      LEFT JOIN users u ON o.user_id = u.id 
      WHERE 1=1
    `;
    const params = [];

    if (filters.status) {
      query += ' AND p.status = ?';
      params.push(filters.status);
    }

    if (filters.payment_method) {
      query += ' AND p.payment_method = ?';
      params.push(filters.payment_method);
    }

    query += ' ORDER BY p.created_at DESC LIMIT ? OFFSET ?';
    params.push(filters.limit || 50, filters.offset || 0);

    const [rows] = await db.query(query, params);
    return rows.map(row => {
      if (row.payment_details) {
        row.payment_details = JSON.parse(row.payment_details);
      }
      return row;
    });
  }

  // Delete payment
  static async delete(id) {
    await db.query('DELETE FROM payments WHERE id = ?', [id]);
  }
}

module.exports = Payment;
