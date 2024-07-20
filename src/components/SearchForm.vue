<template>
    <div class="container mt-4">
      <h2>Buscar Talentos</h2>
      <form @submit.prevent="handleSubmit">
        <div class="mb-3">
          <label for="tier" class="form-label">Tier</label>
          <select id="tier" v-model="filters.tier" class="form-select">
            <option value="">Todos</option>
            <option v-for="n in 5" :key="n" :value="n">{{ n }}</option>
          </select>
        </div>
  
        <div class="mb-3">
          <label for="name" class="form-label">Nombre</label>
          <input type="text" id="name" v-model="filters.nombre" class="form-control" />
        </div>
  
        <div class="mb-3">
          <label class="form-label">Clases</label>
          <div class="row">
            <div class="col-12 col-md-6 col-lg-4 col-xl-2" v-for="clase in allClasesWithAll" :key="clase">
              <div class="form-check">
                <input 
                  class="form-check-input" 
                  type="checkbox" 
                  :value="clase" 
                  v-model="filters.clases" 
                  @change="updateClases(clase)">
                <label class="form-check-label">
                  {{ clase }}
                </label>
              </div>
            </div>
          </div>
        </div>
  
        <button type="submit" class="btn btn-outline-primary">Buscar</button>
      </form>
    </div>
  </template>
  
  
  
  <script>
export default {
  data() {
    return {
      filters: {
        tier: '1',
        nombre: '',
        clases: ['All']
      },
      allClases: ['Ace', 'Alchemist', 'Bard', 'Berserker', 'Cleric', 'Druid', 'Fighter', 'Gunslinger', 'Monk',
       'Necromancer', 'Paladin', 'Ranger', 'Rogue', 'Sorcerer', 'Warlock', 'Wizard'],
    };
  },
  computed: {
    allClasesWithAll() {
      return ['All', ...this.allClases];
    }
  },
  methods: {
    updateClases(clase) {
      if (clase === 'All') {
        if (this.filters.clases.includes('All')) {
          // Si "Todos" está marcado, desmarcar todas las otras opciones
          this.filters.clases = ['All'];
        } else {
          // Si "Todos" no está marcado, asegurarse de que esté seleccionado
          this.filters.clases = [];
        }
      } else {
        const index = this.filters.clases.indexOf('All');
        if (index === -1) {
          // Asegurarse de que "Todos" esté incluido
          this.filters.clases.unshift('All');
        }
      }
    },
    handleSubmit() {
      // Concatenar las opciones seleccionadas
      this.$emit('search', {
        ...this.filters,
        clases: this.filters.clases.join(',')
      });
    }
  }
};
</script>


  
  <style scoped>
  /* Estilos específicos para SearchForm */
  </style>
  