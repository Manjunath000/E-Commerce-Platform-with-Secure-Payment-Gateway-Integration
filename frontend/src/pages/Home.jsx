import { Link } from 'react-router-dom'

function Home() {
  return (
    <div className="home">
      <section className="hero">
        <h1>Welcome to Our E-Commerce Store</h1>
        <p>Secure shopping with industry-grade payment protection</p>
        <Link to="/products" className="btn btn-primary btn-large">
          Shop Now
        </Link>
      </section>
    </div>
  )
}

export default Home
