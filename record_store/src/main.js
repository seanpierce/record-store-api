import Vue from 'vue'
import axios from 'axios'
import Home from './App.vue'
import Admin from './Admin.vue'
import Login from './Login.vue'

const NotFound = { template: '<p>Page not found</p>' }

const routes = {
  '/': Home,
  '/admin': Admin,
  '/login': Login
}

new Vue({
  el: '#app',
  data: {
    currentRoute: window.location.pathname,
    // API: 'http://localhost:3000',
    API: 'https://record-store-api.herokuapp.com',
    loggedIn: null
  },
  computed: {
    ViewComponent () {
      return routes[this.currentRoute] || NotFound
    }
  },
  methods: {
    formatMoney(cost) {
      return parseFloat(cost).toFixed(2)
    },
    getCurrentUser() {
      return localStorage.getItem('current_user') ? JSON.parse(localStorage.getItem('current_user')) : {}
    },
    setCurrentUser(user) {
      localStorage.setItem('current_user', JSON.stringify(user))
    },
    authorizeRoute() {
      let user = this.getCurrentUser()
      axios.get(`${this.API}/sessions`, {headers: user})
        .then(() => {
          this.loggedIn = true
        })
        .catch(err => {
          window.location.pathname = '/login'
        })
    }
  },
  components: {
    Home,
    Admin,
    Login,
  },
  render (h) { return h(this.ViewComponent) }
})
