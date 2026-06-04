import { Link } from 'react-router-dom'

function Checkout() {
  return (
    <div className="checkout">
      <h1>Checkout</h1>
      <form className="checkout-form">
        <section>
          <h2>Shipping Information</h2>
          <input type="text" placeholder="Full Name" required />
          <input type="email" placeholder="Email" required />
          <input type="text" placeholder="Address" required />
          <input type="text" placeholder="City" required />
          <input type="text" placeholder="State" required />
          <input type="text" placeholder="Zip Code" required />
        </section>

        <section>
          <h2>Order Summary</h2>
          <div className="summary">
            <p>Subtotal: $0.00</p>
            <p>Shipping: $0.00</p>
            <p><strong>Total: $0.00</strong></p>
          </div>
        </section>

        <Link to="/payment" className="btn btn-primary btn-large">
          Continue to Payment
        </Link>
      </form>
    </div>
  )
}

export default Checkout
