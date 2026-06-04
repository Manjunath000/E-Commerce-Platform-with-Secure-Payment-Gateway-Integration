-- Insert sample users
INSERT INTO users (email, password_hash, first_name, last_name) VALUES
('user1@example.com', 'hashed_password_1', 'John', 'Doe'),
('user2@example.com', 'hashed_password_2', 'Jane', 'Smith');

-- Insert sample products
INSERT INTO products (name, description, price, stock_quantity, category) VALUES
('Laptop', 'High-performance laptop for professionals', 999.99, 10, 'Electronics'),
('Headphones', 'Wireless noise-cancelling headphones', 199.99, 25, 'Electronics'),
('Smartwatch', 'Advanced fitness tracking smartwatch', 299.99, 15, 'Electronics'),
('Keyboard', 'Mechanical gaming keyboard', 149.99, 20, 'Accessories'),
('Mouse', 'Ergonomic wireless mouse', 49.99, 50, 'Accessories');
