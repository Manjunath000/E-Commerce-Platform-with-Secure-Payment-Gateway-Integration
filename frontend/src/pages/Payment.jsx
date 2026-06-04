import { Elements } from '@stripe/react-stripe-js'
import { loadStripe } from '@stripe/stripe-js'
import PaymentForm from '../components/PaymentForm'
import { useState } from 'react'

const stripePromise = loadStripe(import.meta.env.VITE_STRIPE_PUBLISHABLE_KEY)

function Payment() {
  const [paymentMethod, setPaymentMethod] = useState('stripe')

  return (
    <div className="payment">
      <h1>Payment Method</h1>
      <div className="payment-methods">
        <label>
          <input
            type="radio"
            value="stripe"
            checked={paymentMethod === 'stripe'}
            onChange={(e) => setPaymentMethod(e.target.value)}
          />
          Credit/Debit Card (Stripe)
        </label>
        <label>
          <input
            type="radio"
            value="paypal"
            checked={paymentMethod === 'paypal'}
            onChange={(e) => setPaymentMethod(e.target.value)}
          />
          PayPal
        </label>
      </div>

      {paymentMethod === 'stripe' && (
        <Elements stripe={stripePromise}>
          <PaymentForm />
        </Elements>
      )}

      {paymentMethod === 'paypal' && (
        <div className="paypal-form">
          <button className="btn btn-primary">Pay with PayPal</button>
        </div>
      )}
    </div>
  )
}

export default Payment
