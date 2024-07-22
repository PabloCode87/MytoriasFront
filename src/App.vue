<template>
  <div id="app" class="background-book">
    <SearchForm @search="handleSearch" />
    <TalentoList :talentos="talentos" />
  </div>
</template>

<script>
import SearchForm from './components/SearchForm.vue';
import TalentoList from './components/TalentoList.vue';

export default {
  components: {
    SearchForm,
    TalentoList
  },
  data() {
    return {
      talentos: []
    };
  },
  methods: {
    async handleSearch(filters) {
      try {
        const response = await this.$http.get('/talentos', {
          params: filters
        });
        this.talentos = response.data;
      } catch (error) {
        console.error('Error al obtener talentos:', error);
      }
    }
  }
};
</script>

<style>
@import url('https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.1.3/css/bootstrap.min.css');
@import url('https://fonts.googleapis.com/css2?family=Playfair+Display&display=swap');

#app {
  font-family: 'Playfair Display', serif;
  text-align: center;
  color: #2c3e50;
}

/* Clase para el fondo de la aplicación con la imagen de libro */
.background-book {
  background-image: url('@/assets/footer.jpg'); /* Ajusta la ruta según la ubicación de tu imagen */
  background-repeat: repeat;
  background-size: auto; /* Puedes ajustar esto según cómo quieras que se muestre la imagen */
  min-height: 100vh;
  color: #2c3e50;
}

body, html {
  height: 100%;
  margin: 0;
  padding: 0;
  background: none;
  font-family: Tahoma;
}

.container {
  background: rgba(255, 255, 255, 0.8);
  border-radius: 8px;
  padding: 20px;
  color: #2c3e50;
}

.form-label, .form-check-label {
  color: #2c3e50;
}

.form-control, .form-select, .form-check-input {
  border: 1px solid #2c3e50;
}

.form-control::placeholder {
  color: #2c3e50;
}
</style>
