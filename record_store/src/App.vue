<template>
<div>
  <h3>{{title}}</h3>
  <ul id="example-1">
  <li v-for="item in items">
    {{ item.artist }} - {{ item.title }}
    ${{ item.cost }}
  </li>
</ul>
</div>
</template>

<script>
import axios from 'axios';

export default {
  name: 'app',
  data () {
    return {
      title: 'Record Store',
      items: []
    }
  },
  methods: {
    getItems: function () {
      axios.get("https://record-store-api.herokuapp.com/items")
      .then((response) => {
        this.items = response.data
      }, (error) => {
        console.log(error)
      })
    }
  },
  mounted:function(){
    this.getItems()
  },
}
</script>

<style lang="scss">
</style>
