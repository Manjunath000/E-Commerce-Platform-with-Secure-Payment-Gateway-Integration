import { useState, useEffect } from 'react'
import { useParams } from 'react-router-dom'
import { getProductById } from '../services/productService'

function ProductDetail() {
  const { id } = useParams()
  const [product, setProduct] = useState(null)
  const [loading, setLoading] = useState(true)
  const [quantity, setQuantity] = useState(1)

  useEffect(() => {
    const fetchProduct = async () => {
      try {
        const data = await getProductById(id)
        setProduct(data)
      } finally {
        setLoading(false)
      }
    }

    fetchProduct()
  }, [id])

  const handleAddToCart = () => {
    console.log(`Added ${quantity} of ${product.name} to cart`)
  }

  if (loading) return <div>Loading...</div>
  if (!product) return <div>Product not found</div>

  return (
    <div className="product-detail">
      <div className="product-image">
        <img src={product.image} alt={product.name} />
      </div>
      <div className="product-info">
        <h1>{product.name}</h1>
        <p className="description">{product.description}</p>
        <p className="price">${product.price}</p>
        <div className="quantity">
          <label>Quantity:</label>
          <input
            type="number"
            min="1"
            value={quantity}
            onChange={(e) => setQuantity(parseInt(e.target.value))}
          />
        </div>
        <button onClick={handleAddToCart} className="btn btn-primary">
          Add to Cart
        </button>
      </div>
    </div>
  )
}

export default ProductDetail
