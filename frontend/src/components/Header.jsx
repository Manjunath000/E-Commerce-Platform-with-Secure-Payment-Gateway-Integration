import { Link } from 'react-router-dom'
import { FaShoppingCart } from 'react-icons/fa'

function Header() {
  return (
    <header className="header">
      <div className="container">
        <div className="logo">
          <h1>E-Commerce Store</h1>
        </div>
        <nav className="nav">
          <Link to="/">Home</Link>
          <Link to="/products">Products</Link>
          <Link to="/cart">
            <FaShoppingCart /> Cart
          </Link>
        </nav>
      </div>
    </header>
  )
}

export default Header
