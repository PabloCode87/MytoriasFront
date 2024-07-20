import { createApp } from 'vue';
import App from './App.vue';
import 'bootstrap/dist/css/bootstrap.min.css';
import axios from 'axios';

const app = createApp(App);

// Configura axios globalmente
app.config.globalProperties.$http = axios.create({
  baseURL: 'http://localhost:3000/api',
});

app.mount('#app');
