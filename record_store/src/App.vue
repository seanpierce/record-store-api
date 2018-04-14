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
const API = {
  dev: 'http://localhost:3000',
  prod: 'https://record-store-api.herokuapp.com'
}

import axios from 'axios';
import Item from './components/item.vue'
import Loader from './components/loader.vue'

export default {
  name: 'app',
  data() {
    return {
      title: 'Rails/Vue Record Store',
      items: [],
      isLoading: true,
      page: window.location.pathname
    }
  },
  methods: {
    getItems() {
      axios.get(`${API.prod}/items`)
      .then((response) => {
        console.log(response)
        this.items = response.data
        this.isLoading = false;
      }, (error) => {
        console.log(error)
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
  .item {
    display: inline;
  }
</style>
