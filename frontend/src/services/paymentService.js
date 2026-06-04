import API from './api'

export const createStripePaymentIntent = async (amount, currency) => {
  try {
    const response = await API.post('/payments/stripe/create-payment-intent', {
      amount,
      currency,
    })
    return response.data
  } catch (error) {
    throw error
  }
}

export const createPayPalPayment = async (amount, currency) => {
  try {
    const response = await API.post('/payments/paypal/create-payment', {
      amount,
      currency,
    })
    return response.data
  } catch (error) {
    throw error
  }
}

export const executePayPalPayment = async (paymentId, payerId) => {
  try {
    const response = await API.post('/payments/paypal/execute-payment', {
      paymentId,
      payerId,
    })
    return response.data
  } catch (error) {
    throw error
  }
}

export const verifyPayment = async (paymentId) => {
  try {
    const response = await API.post('/payments/verify', { paymentId })
    return response.data
  } catch (error) {
    throw error
  }
}
