<template>
  <div class="control has-icons-right">
    <form accept-charset="UTF8" :method="method">
      <input name="utf8" type="hidden" value="✓">
      <input type="text" :name="inputName" class="input" @keyup="search">
      <span class="icon is-small is-right"><i class="fa fa-search"></i></span>
    </form>
  </div>
</template>

<script>
import _ from 'lodash'

export default {
  props: ['name', 'action', 'object', 'method'],
  data() {
    return {
    }
  },
  computed: {
    inputName() {
      if (this.object){
        return `${this.object}[${this.name}]`
      } else {
        return this.name
      }
    }
  },
  methods: {
    search: _.debounce((event) => {
      // Make ajax call to action here.
    }, 1500)
  }
}
</script>
