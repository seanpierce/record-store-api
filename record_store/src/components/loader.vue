<template>
  <div class="loader"></div>
</template>

<script>
export default {
  name: 'Loader',
  data() {
    return {
    }
  },
  props: [],
  methods: {
  },
  mounted: () => {
    console.log('loading...')
  },
}
</script>

<style>
  .loader {
      border: 4px solid #fff;
      border-top: 4px solid #333;
      border-radius: 50%;
      width: 40px;
      height: 40px;
      animation: spin 0.5s linear infinite;
  }

  @keyframes spin {
      0% { transform: rotate(0deg); }
      100% { transform: rotate(360deg); }
  }
</style>
