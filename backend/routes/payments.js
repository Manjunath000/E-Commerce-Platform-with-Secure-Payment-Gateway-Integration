const express = require('express');
const router = express.Router();
const paymentController = require('../controllers/paymentController');
const auth = require('../middleware/auth');

router.post('/stripe/create-payment-intent', auth, paymentController.createStripePaymentIntent);
router.post('/paypal/create-payment', auth, paymentController.createPayPalPayment);
router.post('/paypal/execute-payment', auth, paymentController.executePayPalPayment);
router.post('/verify', auth, paymentController.verifyPayment);

module.exports = router;
