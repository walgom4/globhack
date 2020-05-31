/* eslint-disable no-console */
import router from "@/router/index";
import axios from "axios";
//import { TokenService } from "@/services/storage.service";

const ApiService = axios.create({
  baseURL: process.env.VUE_APP_API_URL,
  get(resource) {
    return axios.get(resource)
  },

  post(resource, data) {
      return axios.post(resource, data)
  },

  put(resource, data) {
      return axios.put(resource, data)
  },

  delete(resource) {
      return axios.delete(resource)
  },
  customRequest(data) {
    return axios(data)
  }
});


// Interceptor de request para añadir el token
// ApiService.interceptors.request.use(
//   config => {
//     if(TokenService.getKey()) {
//       config.headers.Authorization = 'Basic ' + btoa(TokenService.getUser() + ':' + TokenService.getUserPw()); 
//       config.headers.User = `${TokenService.getUser()}`;
//     }

//     return config;
//     // Do something with request error
//   },
//   error => Promise.reject(error)
// );


// Interceptor de respuestas de los servicios
ApiService.interceptors.response.use(
  response => response,
  error => {
    router.push({
      name: "ServerError"
    });      
    return Promise.reject(error);
  }
);

export default ApiService;
