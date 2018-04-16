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
      <label for="description">Description</label>
      <textarea name="description" v-model="newItem.description" />
    </div>
    <div class="filedSet">
      <label for="cost">Cost</label>
      <input type="text" name="cost" v-model="newItem.cost">
    </div>
    <div class="filedSet">
      <label for="image">Image</label>
      <input type="file" name="image" v-on:change="setFile($event)">
    </div>
    <input v-if="!isLoading" type="submit" value="Submit">
    <Loader v-if="isLoading" />
  </form>
</div>
</template>

<script>
import axios from 'axios';
import SuccessMessage from './components/successMessage.vue'
import Loader from './components/Loader.vue'

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
      this.isLoading = true
      let config = {
        headers: {
          'X-User-Email': 'sumler.sean@gmail.com',
          'X-User-Token': 'WNzzpCB3yygjYmZu--45'
        }
      }
      let item = {...this.newItem}
      console.log('Posting item:', item)
      axios.post(`${this.$root.API}/items`, item, config)
        .then(res => {
          this.newItem = {}
          console.log(res)
          this.isLoading = false
        })
        .catch(err => {
          console.log(err)
          this.isLoading = false
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
    Loader,
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
    margin-bottom: 4px;
  }
  input[type="text"], textarea {
    width: 100%;
    max-width: 300px;
    border: solid 1px lightgray;
    padding: 4px;
  }
  .filedSet {
    margin-bottom: 1em;
  }
</style>
