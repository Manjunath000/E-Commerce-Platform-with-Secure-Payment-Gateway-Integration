import API from './api'

export const getProducts = async () => {
  try {
    const response = await API.get('/products')
    return response.data
  } catch (error) {
    throw error
  }
}

export const getProductById = async (id) => {
  try {
    const response = await API.get(`/products/${id}`)
    return response.data
  } catch (error) {
    throw error
  }
}

export const createProduct = async (product) => {
  try {
    const response = await API.post('/products', product)
    return response.data
  } catch (error) {
    throw error
  }
}

export const updateProduct = async (id, product) => {
  try {
    const response = await API.put(`/products/${id}`, product)
    return response.data
  } catch (error) {
    throw error
  }
}

export const deleteProduct = async (id) => {
  try {
    const response = await API.delete(`/products/${id}`)
    return response.data
  } catch (error) {
    throw error
  }
}
