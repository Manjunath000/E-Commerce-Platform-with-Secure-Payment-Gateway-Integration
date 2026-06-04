import API from './api'

export const register = async (email, password) => {
  try {
    const response = await API.post('/auth/register', { email, password })
    return response.data
  } catch (error) {
    throw error
  }
}

export const login = async (email, password) => {
  try {
    const response = await API.post('/auth/login', { email, password })
    localStorage.setItem('token', response.data.token)
    return response.data
  } catch (error) {
    throw error
  }
}

export const logout = () => {
  localStorage.removeItem('token')
}
