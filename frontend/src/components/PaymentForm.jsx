import { CardElement, useStripe, useElements } from '@stripe/react-stripe-js'
import { useState } from 'react'

function PaymentForm() {
  const stripe = useStripe()
  const elements = useElements()
  const [error, setError] = useState(null)
  const [loading, setLoading] = useState(false)

  const handleSubmit = async (e) => {
    e.preventDefault()
    setLoading(true)

    try {
      const { token, error } = await stripe.createToken(elements.getElement(CardElement))
      if (error) {
        setError(error.message)
      } else {
        // Process payment
        console.log('Token created:', token)
      }
    } catch (err) {
      setError(err.message)
    }
    setLoading(false)
  }

  return (
    <form onSubmit={handleSubmit} className="payment-form">
      <CardElement />
      {error && <p className="error">{error}</p>}
      <button type="submit" disabled={!stripe || loading} className="btn btn-primary">
        {loading ? 'Processing...' : 'Pay Now'}
      </button>
    </form>
  )
}

export default PaymentForm
