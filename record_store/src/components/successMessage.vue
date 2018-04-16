<template>
<div class="success-message">
  {{ message }}
</div>
</template>

<script>

export default {
  name: 'successMessage',
  data() {
    return {
      message: '',
      show: false
    }
  },
  methods: {
    show(message) {
      this.message = message
      this.show = true
      setTimeout(() => {
        this.show = false
      }, 3000)
    }
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
  .success-message {
    position: absolute;
    top: 40px;
    left: 50%;
    transform: translateX(-50%);
    background: green;
    color: white;
  }
</style>
