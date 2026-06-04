import { useState } from 'react'

export const useCart = () => {
  const [cartItems, setCartItems] = useState([])

  const addToCart = (product) => {
    const existing = cartItems.find((item) => item.id === product.id)
    if (existing) {
      existing.quantity += product.quantity
    } else {
      setCartItems([...cartItems, product])
    }
  }

  const removeFromCart = (productId) => {
    setCartItems(cartItems.filter((item) => item.id !== productId))
  }

  const clearCart = () => {
    setCartItems([])
  }

  return { cartItems, addToCart, removeFromCart, clearCart }
}
