<template class="ok">
  <div class="item">
    <p>{{ artist }} - {{ title }} ${{ formatMoney(cost) }}</p>
    <img class="item-image" :src="image"/>
  </div>
</template>

<script>
export default {
  name: 'Item',
  data() {
    return {
    }
  },
  props: ['id', 'artist', 'title', 'cost', 'image'],
  methods: {
    formatMoney(cost) {
      return parseFloat(cost).toFixed(2)
    }
  },
  mounted: () => {
    console.log('mount up')
  },
}
</script>

<style>
</style>
