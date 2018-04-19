<template>
<div>
  <h3>{{ title }}</h3>
  <form v-on:submit.prevent="login()">
    <input type="email" name="email" placeholder="email" v-model="credentials.email" />
    <input type="password" name="password" placeholder="password" v-model="credentials.password" />
    <input type="submit" value="Submit" />
  </form>
</div>
</template>

<script>
import axios from 'axios';

export default {
  name: 'login',
  data() {
    return {
      title: 'Login',
      credentials: {},
      current_user: null
    }
  },
  methods: {
    login() {
      axios.post(`${this.$root.API}/sessions`, this.credentials)
        .then(res => {
          console.log(res.data)
          let user = {
            'X-User-Email': res.data.email,
            'X-User-Token': res.data.authentication_token
          }
          this.$root.setCurrentUser(user)
          window.location.pathname = '/admin'
        })
        .catch(err => {
          console.log(err)
        })
    },
  },
  mounted: function() {
  },
  components: {
  }
}
</script>

<style lang="scss">
  * {
    font-family: sans-serif;
  }
  // input, label {
  //   display: block;
  //   margin-bottom: 4px;
  // }
  // input[type="text"], textarea {
  //   width: 100%;
  //   max-width: 300px;
  //   border: solid 1px lightgray;
  //   padding: 4px;
  // }
  // .filedSet {
  //   margin-bottom: 1em;
  // }
</style>
