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
/* Estilos globales y del componente */
#app {
  font-family: 'Playfair Display', serif;
  text-align: center;
  color: #2c3e50;
}

/* Clase para el fondo de la aplicación con la imagen de libro */
.background-book {
  background-image: url('@/assets/footer.jpg');
  background-repeat: repeat;
  background-size: auto;
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
</style>
