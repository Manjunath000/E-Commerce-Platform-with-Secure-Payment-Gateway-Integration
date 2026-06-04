import { Link } from 'react-router-dom'
import { FaCheckCircle } from 'react-icons/fa'

function OrderConfirmation() {
  return (
    <div className="order-confirmation">
      <FaCheckCircle className="success-icon" />
      <h1>Order Confirmed!</h1>
      <p>Thank you for your purchase.</p>
      <div className="confirmation-details">
        <p><strong>Order ID:</strong> #123456</p>
        <p><strong>Status:</strong> Processing</p>
        <p>You will receive a confirmation email shortly.</p>
      </div>
      <Link to="/products" className="btn btn-primary">
        Continue Shopping
      </Link>
    </div>
  )
}

export default OrderConfirmation
