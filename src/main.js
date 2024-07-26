import { createApp } from 'vue';
import App from './App.vue';
import 'bootstrap/dist/css/bootstrap.min.css';
import axios from 'axios';

const app = createApp(App);

// Configura axios globalmente
app.config.globalProperties.$http = axios.create({
  baseURL: process.env.VUE_APP_BACKEND_URL || 'http://localhost:3000/api', // Usa la variable de entorno o localhost
});

app.mount('#app');
