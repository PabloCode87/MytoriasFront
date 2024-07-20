<template>
  <div id="app">
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
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;
}
</style>
