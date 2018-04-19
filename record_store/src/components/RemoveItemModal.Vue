<template>
  <div class="remove-item-modal">
      <div class="are-you-sure">
          <h3>Are you sure you want to remove {{item.artist}} - {{item.title}}?</h3>
          <span class="option">Yes</span> <span class="option">No</span>
      </div>
  </div>
</template>

<script>
export default {
  name: 'RemoveItemModal',
  data() {
    return {
    }
  },
  props: {
      item: {
          type: Object
      }
  },
  methods: {
  },
  mounted: () => {
    console.log('loading...')
  },
}
</script>

<style>
    .remove-item-modal {
        width: 100%;
        height: 100%;
        z-index: 10;
        position: fixed;
        top: 1;
        left: 1;
        background-color: rgba(0, 0, 0, 0.8);
    }
    .are-you-sure {
        color: white;
    }
    span.option {
        border: solid 1px white;
        padding: 4px;
    }
</style>
