import API from './api'

export const getOrders = async () => {
  try {
    const response = await API.get('/orders')
    return response.data
  } catch (error) {
    throw error
  }
}

export const getOrderById = async (id) => {
  try {
    const response = await API.get(`/orders/${id}`)
    return response.data
  } catch (error) {
    throw error
  }
}

export const createOrder = async (order) => {
  try {
    const response = await API.post('/orders', order)
    return response.data
  } catch (error) {
    throw error
  }
}

export const updateOrder = async (id, order) => {
  try {
    const response = await API.put(`/orders/${id}`, order)
    return response.data
  } catch (error) {
    throw error
  }
}
