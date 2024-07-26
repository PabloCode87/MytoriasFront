<template>
  <div class="container mt-4">
    <h2>Resultados de la Búsqueda</h2>
    <div v-if="talentos.length === 0" class="alert alert-info">
      No se encontraron talentos.
    </div>
    <div class="row">
      <div v-for="talento in talentos" :key="talento._id" class="col-12 col-md-6 col-lg-4 mb-4">
        <div class="card h-100">
          <div class="card-body">
            <h3 class="card-title"><strong>{{ talento.nombre }}</strong></h3>
            <p class="card-text"><strong>Tier:</strong> {{ talento.tier }}</p>
            <p class="card-text"><strong>Ranked:</strong> {{ talento.ranked ? 'Sí' : 'No' }}</p>
            <p class="card-text"><strong>Clases:</strong> {{ (talento.clases || []).join(', ') }}</p>
            <p class="card-text"><strong>Descripción:</strong> {{ talento.descripcion }}</p>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  props: {
    talentos: {
      type: Array,
      default: () => []
    }
  }
};
</script>

<style scoped>
.container {
  background-color: #f4ecd800;
}

.card {
  background-color: #f5b72e;
  border: 1px solid #f4ecd8;
  box-shadow: 0 4px 20px rgba(255, 255, 255, 0.5);
}
h2 {
  color: #fff4df;
}
.card-title, .card-text {
  color: #424242;
}
.card-title {
  text-shadow: 0 0px 1px rgb(5, 5, 5);
}
</style>
