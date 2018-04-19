<template>
  <div class="container">
    <div v-if="!selectedItem">
      <h3>{{title}}</h3>
      <Loader v-if="isLoading">Loading...</Loader>
      <div v-for="(item, index) in items" :key="index" class="item">
        <div v-on:click="setSelectedItem(item)">
          <Item :item="item"/>
        </div>
      </div>
    </div>
    <ItemDetails v-if="selectedItem" :selectedItem="selectedItem" />
  </div>
</template>

<script>
import axios from 'axios';
import Item from './components/Item.vue'
import Loader from './components/Loader.vue'
import ItemDetails from './components/ItemDetails.vue'

export default {
  name: 'home',
  data() {
    return {
      title: 'Rails/Vue Record Store',
      items: [],
      isLoading: true,
      selectedItem: null
    }
  },
  methods: {
    getItems() {
      axios.get(`${this.$root.API}/items`)
      .then(res => {
        this.items = res.data
        this.isLoading = false;
      }, err => {
        console.log(err)
      })
    },
    setSelectedItem(item) {
      this.selectedItem = item
    }
  },
  mounted: function() {
    this.getItems()
  },
  components: {
    Item,
    Loader,
    ItemDetails
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
  .selected-item {
    .title {
      font-size: 2em;
    }
    .artist {
      font-size: 1.5em;
    }
    .cost {
      font-size: 1.25em;
    }
    .back {
      cursor: pointer;
      display: inline;
      &:hover {
        opacity: 0.8;
      }
    }
  }
</style>
