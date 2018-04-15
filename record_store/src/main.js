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
    currentRoute: window.location.pathname
  },
  computed: {
    ViewComponent () {
      return routes[this.currentRoute] || NotFound
    }
  },
  components: {
    Home,
    Admin
  },
  render (h) { return h(this.ViewComponent) }
})
