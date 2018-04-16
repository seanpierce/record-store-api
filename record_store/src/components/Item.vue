<template>
  <div class="item">
    <img :src="image"/>
    <div class="info">
      <p>
        {{ artist }} - {{ title }}<br>
        <span>${{ this.$root.formatMoney(cost) }}</span>
      </p>
    </div>
  </div>
</template>

<script>
export default {
  name: 'Item',
  data() {
    return {
    }
  },
  props: ['id', 'artist', 'title', 'cost', 'image'],
  methods: {
  },
  mounted: () => {
    console.log('mount up')
  },
}
</script>

<style>
.item {
  position: relative;
  display: inline-block;
  margin: 2px;
  width: 200px;
  height: 200px;
  overflow: hidden;
  cursor: pointer;
}
.item img {
  width: 100%;;
}
.item .info {
  position: absolute;
  background: rgba(0,0,0,0.7);
  color: white;
  z-index: 10;
  top: 100%;
  left: 0;
  width: 100%;
  height: 100%;
  transition: all 0.25s;
}
.item .info p {
  padding: 6px;
  position: absolute;
  top: 50%;
  transform: translateY(-60%);
}
.item .info p span {
  font-size: 1.25em;
}
.item:hover .item .info {
  top: 0;
}
</style>
