<template>
  <div class="container">
    <div v-if="!selectedItem">
      <h3>{{title}}</h3>
      <Loader v-if="isLoading">Loading...</Loader>
      <div v-for="(item, index) in items" :key="index" class="item">
        <div v-on:click="setSelectedItem(item)">
          <Item :id="item.id" :artist="item.artist" :title="item.title" :cost="item.cost" :image="item.image"/>
        </div>
      </div>
    </div>
    <div v-if="selectedItem" class="selected-item">
      <div class="title">{{ selectedItem.title }}</div>
      <div class="artist">{{ selectedItem.artist }}</div>
      <div class="cost">${{ this.$root.formatMoney(selectedItem.cost) }}</div>
      <div class="description">{{ selectedItem.description }}</div>
      <p v-on:click="selectedItem = null" class="back">< Back</p>
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
      isLoading: true,
      selectedItem: null
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
