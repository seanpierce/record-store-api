<template>
<div>
  <h3>{{title}}</h3>
  <Loader v-if="isLoading">Loading...</Loader>
  <div v-for="item in items" class="item">
    <Item :id="item.id" :artist="item.artist" :title="item.title" :cost="item.cost" :image="item.image" />
  </div>
</div>
</template>

<script>
import axios from 'axios';
import Item from './components/item.vue'
import Loader from './components/loader.vue'

export default {
  name: 'home',
  data() {
    return {
      title: 'Rails/Vue Record Store',
      items: [],
      isLoading: true
    }
  },
  methods: {
    getItems() {
      axios.get(`${this.$root.API}/items`)
      .then(res => {
        console.log(res)
        this.items = res.data
        this.isLoading = false;
      }, err => {
        console.log(err)
      })
    }
  },
  mounted: function() {
    this.getItems()
  },
  components: {
    Item,
    Loader
  }
}
</script>

<style lang="scss">
  * {
    font-family: sans-serif;
  }
  Item {
    position: relative;
    display: inline-block;
  }
</style>
