const { body, validationResult } = require('express-validator');

const validateRequest = (req, res, next) => {
  const errors = validationResult(req);
  if (!errors.isEmpty()) {
    return res.status(400).json({ errors: errors.array() });
  }
  next();
};

const userValidation = [
  body('email').isEmail().normalizeEmail(),
  body('password').isLength({ min: 6 }),
];

const productValidation = [
  body('name').notEmpty().trim(),
  body('price').isFloat({ min: 0 }),
  body('description').notEmpty(),
];

module.exports = {
  validateRequest,
  userValidation,
  productValidation,
};
