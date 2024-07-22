<template>
  <div class="container mt-4">
    <h2>Buscar Talentos</h2>
    <form @submit.prevent="handleSubmit">
      <div class="row">
        <div class="mb-3 col-12 col-md-6">
          <label for="tier" class="form-label">Por Tier</label>
          <select id="tier" v-model="filters.tier" class="form-select">
            <option value="">Todos los Tiers</option>
            <option v-for="n in 5" :key="n" :value="n">{{ n }}</option>
          </select>
        </div>

        <div class="mb-3 col-12 col-md-6">
          <label for="name" class="form-label">Por Nombre</label>
          <input type="text" id="name" v-model="filters.nombre" class="form-control" />
        </div>
      </div>

      <div class="mb-3">
        <label class="form-label">Por Clases</label>
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

      <button type="submit" class="btn btn-primary">Buscar Talento/s</button>
    </form>
  </div>
</template>

<script>
export default {
  data() {
    return {
      filters: {
        tier: '',
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
          this.filters.clases = ['All'];
        } else {
          this.filters.clases = [];
        }
      } else {
        const index = this.filters.clases.indexOf('All');
        if (index === -1) {
          this.filters.clases.unshift('All');
        }
      }
    },
    handleSubmit() {
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

/* Ajustes adicionales para asegurar la legibilidad del contenido */
body, html {
  height: 100%;
  margin: 0;
  padding: 0;
  background: none;
  font-family: 'Avenir', Helvetica, Arial, sans-serif;
}

.container {
  background: #f4ecd800;
  border-radius: 8px;
  padding: 20px;
  color: #fff4df;
}

.form-label, .form-check-label {
  color: rgb(255, 244, 223);
}

.form-control, .form-select, .form-check-input {
  border: 1px solid #fff4df;
}

.form-control::placeholder {
  color: #fff4df;
}
</style>
