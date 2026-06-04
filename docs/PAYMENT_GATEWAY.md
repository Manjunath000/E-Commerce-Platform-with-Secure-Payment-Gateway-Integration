# Payment Gateway Integration Guide

## Stripe Integration

### Setup

1. Create a Stripe account at https://stripe.com
2. Get your API keys from the Stripe Dashboard
3. Add to `.env`:
   ```
   STRIPE_SECRET_KEY=sk_test_...
   STRIPE_PUBLISHABLE_KEY=pk_test_...
   ```

### Implementation

The backend uses the `stripe` npm package for integration.

**Create Payment Intent**:
```javascript
const paymentIntent = await stripe.paymentIntents.create({
  amount: 9999,
  currency: 'usd',
});
```

**Verify Webhook**:
```javascript
const event = stripe.webhooks.constructEvent(body, sig, endpoint_secret);
```

## PayPal Integration

### Setup

1. Create a PayPal Developer account
2. Get your Client ID and Secret
3. Add to `.env`:
   ```
   PAYPAL_MODE=sandbox
   PAYPAL_CLIENT_ID=your_client_id
   PAYPAL_CLIENT_SECRET=your_client_secret
   ```

### Implementation

The backend uses the `paypal-rest-sdk` package.

**Create Payment**:
```javascript
const payment = {
  intent: 'sale',
  payer: {
    payment_method: 'paypal'
  },
  transactions: [{
    amount: {
      total: '10.00',
      currency: 'USD'
    }
  }],
  redirect_urls: {
    return_url: 'http://localhost:3000/payment-success',
    cancel_url: 'http://localhost:3000/payment-cancel'
  }
};

paypal.payment.create(payment, (err, payment) => {
  // Handle response
});
```

## Security Best Practices

1. **Never expose API keys**: Keep secret keys in environment variables
2. **Use HTTPS**: Always use HTTPS in production
3. **Validate amounts**: Always validate payment amounts on the server
4. **Store securely**: Encrypt sensitive payment data
5. **PCI Compliance**: Don't store credit card details

## Testing

### Stripe Test Cards

- Visa: `4242 4242 4242 4242`
- Mastercard: `5555 5555 5555 4444`
- Amex: `3782 822463 10005`

### PayPal Sandbox

Use sandbox account credentials provided in PayPal Dashboard.

## Webhook Handling

Both gateways support webhooks for payment events:

- Stripe: `/webhook/stripe`
- PayPal: `/webhook/paypal`

Configure webhook endpoints in respective dashboards.
