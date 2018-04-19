<template>
  <div v-if="selectedItem" class="selected-item">
    <div class="title">{{ selectedItem.title }}</div>
    <div class="artist">{{ selectedItem.artist }}</div>
    <div class="cost">${{ this.$root.formatMoney(selectedItem.cost) }}</div>
    <div class="description">{{ selectedItem.description }}</div>
    <p v-on:click="$parent.selectedItem = null" class="back">< Back</p>
  </div>
</template>

<script>
import axios from 'axios';

export default {
  name: 'itemDetails',
  data() {
    return {
    }
  },
  methods: {
  },
  mounted: function() {
  },
  components: {
  },
  props: {
      selectedItem: {
      type: Object
    }
  }
}
</script>

<style lang="scss">
  * {
    font-family: sans-serif;
  }
</style>
