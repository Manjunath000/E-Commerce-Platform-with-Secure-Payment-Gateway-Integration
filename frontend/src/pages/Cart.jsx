import { Link } from 'react-router-dom'

function Cart() {
  return (
    <div className="cart">
      <h1>Shopping Cart</h1>
      <div className="cart-items">
        {/* Cart items will be displayed here */}
      </div>
      <div className="cart-summary">
        <h2>Summary</h2>
        <div className="summary-item">
          <span>Subtotal:</span>
          <span>$0.00</span>
        </div>
        <div className="summary-item">
          <span>Shipping:</span>
          <span>$0.00</span>
        </div>
        <div className="summary-total">
          <span>Total:</span>
          <span>$0.00</span>
        </div>
        <Link to="/checkout" className="btn btn-primary btn-large">
          Proceed to Checkout
        </Link>
      </div>
    </div>
  )
}

export default Cart
