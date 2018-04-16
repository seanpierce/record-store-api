import Vue from 'vue'
import Home from './App.vue'
import Admin from './Admin.vue'

const NotFound = { template: '<p>Page not found</p>' }

const routes = {
  '/': Home,
  '/admin': Admin
}

new Vue({
  el: '#app',
  data: {
    currentRoute: window.location.pathname,
    API: 'http://localhost:3000',
    // API: 'https://record-store-api.herokuapp.com'
  },
  computed: {
    ViewComponent () {
      return routes[this.currentRoute] || NotFound
    }
  },
  methods: {
    formatMoney(cost) {
      return parseFloat(cost).toFixed(2)
    }
  },
  components: {
    Home,
    Admin
  },
  render (h) { return h(this.ViewComponent) }
})
