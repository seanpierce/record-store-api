<template>
  <div v-if="$root.loggedIn">
    <h3>{{ title }}</h3>
    <ul id="admin-actions">
      <li v-on:click="logout()"><span>Log Out</span></li>
      <li v-on:click="goHome()"><span>View Catalog</span></li>
      <li v-on:click="adminSection = 'add'"><span>Add New Item</span></li>
      <li v-on:click="adminSection = 'edit'"><span>Edit / Remove Items</span></li>
    </ul>
    
    <hr/>

    <div class="admin-section" v-if="adminSection === 'add'">
      <h4>Add A New Item</h4>
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
          <input id="image-input" type="file" name="image" v-on:change="setFile($event)" />
        </div>
        <input v-if="!isLoading" type="submit" value="Submit">
        <Loader v-if="isLoading" />
      </form>
    </div>

    <div class="admin-section" v-if="adminSection === 'edit'">
      <h4>Edit / Remove Items</h4>
      <Loader v-if="isLoading" />
      <table id="edit-items">
        <tbody>
          <tr v-for="(item, index) in items" :key="index" class="edit-item">
            <td class="edit-action">Edit</td>
            <td class="edit-action">Remove</td>
            <td>{{item.artist}} - {{item.title}}</td>
          </tr>
        </tbody>
      </table>
    </div>

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
      items: [],
      isLoading: false,
      current_user: null,
      adminSection: null
    }
  },
  methods: {
    submitNewItem() {
      this.isLoading = true
      let item = {...this.newItem}
      let user = this.$root.getCurrentUser()
      console.log('Posting item:', item)
      axios.post(`${this.$root.API}/items`, item, {headers:user})
        .then(res => {
          this.newItem = {}
          console.log(res)
          this.isLoading = false
          this.resetFileInputs()
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
    },
    resetFileInputs() {
      document.getElementById("image-input").value = ""
      // more in the future?
    },
    logout() {
      let user = this.$root.getCurrentUser()
      axios.delete(`${this.$root.API}/sessions`, {headers:user})
        .then(() => {
          this.$root.authorizeRoute()
        })
        .catch(err => {
          console.log(err)
        })
    },
    goHome() {
      window.location.pathname = '/'
    },
    getItems() {
      this.isLoading = true
      axios.get(`${this.$root.API}/items`)
        .then(res => {
          this.items = res.data
          this.isLoading = false;
        }, err => {
          console.log(err)
        })
    },
  },
  mounted: function() {
    this.$root.authorizeRoute()
  },
  components: {
    Loader,
    SuccessMessage,
  },
  watch: {
    adminSection: function (val) {
      if (val === 'edit' && this.items.length === 0)
        this.getItems()
    },
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
  #admin-actions {
    list-style: none;
    padding: 0;
    span {
      cursor: pointer;
      transition: all 0.25s;
      &:hover {
        opacity: 0.8;
      }
    }
  }
  table#edit-items {
    border-collapse: collapse;
  }
  tr.edit-item {
    border-collapse: collapse;
    td {
      padding: 4px;
      transition: all 0.25s;
    }
    td.edit-action {
      cursor: pointer;
      &:hover {
        background-color: lightgray;
      }
    }
    &:nth-child(odd) {
      background-color: #f3f3f3;
    }
  }
</style>
