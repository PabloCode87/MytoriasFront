<template>
    <div class="container mt-4">
      <h2>Resultados de la Búsqueda</h2>
      <div v-if="talentos.length === 0" class="alert alert-info">
        No se encontraron talentos.
      </div>
      <ul class="list-group">
        <li v-for="talento in talentos" :key="talento._id" class="list-group-item">
          <h5>{{ talento.nombre }}</h5>
          <p><strong>Tier:</strong> {{ talento.tier }}</p>
          <p><strong>Ranked:</strong> {{ talento.ranked ? 'Sí' : 'No' }}</p>
          <p><strong>Clases:</strong> {{ talento.clases.join(', ') }}</p>
          <p><strong>Descripción:</strong> {{ talento.descripcion }}</p>
        </li>
      </ul>
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
  