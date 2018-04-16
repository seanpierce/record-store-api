<template>
<div>
  <h3>{{ title }}</h3>
  <form id="new-item" v-on:submit.prevent="submitNewItem()">
    <div class="filedSet">
      <label for="artist">Artist</label>
      <input type="text" name="artist" v-model="newItem.artist">
    </div>
    <div class="filedSet">
      <label for="title">Title</label>
      <input type="text" name="title" v-model="newItem.title">
    </div>
    <div class="filedSet">
      <label for="cost">Cost</label>
      <input type="text" name="cost" v-model="newItem.cost">
    </div>
    <div class="filedSet">
      <label for="image">Image</label>
      <input type="file" name="image" v-on:change="setFile($event)">
    </div>
    <input type="submit" value="Submit">
  </form>
</div>
</template>

<script>
import axios from 'axios';
import SuccessMessage from './components/successMessage.vue'

export default {
  name: 'admin',
  data() {
    return {
      title: 'Admin',
      newItem: {},
      isLoading: false
    }
  },
  methods: {
    submitNewItem() {
      let item = {...this.newItem}
      console.log('Posting item:', item)
      axios.post(`${this.$root.API}/items`, item)
        .then(res => {
          this.newItem = {}
          console.log(res)
        })
        .catch(err => {
          console.log(err)
        })
    },
    setFile(e) {
      let file = e.target.files[0]
      let reader = new FileReader()
      reader.onload = fileLoadedEvent => {
        let srcData = fileLoadedEvent.target.result; // <--- data: base64
        let newImage = document.createElement('img');
        newImage.src = srcData;
        // use this for thumb preview
        this.newItem.image = srcData
      }
      reader.readAsDataURL(file)
    }
  },
  mounted: function() {
  },
  components: {
    SuccessMessage
  }
}
</script>

<style lang="scss">
  * {
    font-family: sans-serif;
  }
  input, label {
    display: block;
  }
  .filedSet {
    margin-bottom: 1em;
  }
</style>
