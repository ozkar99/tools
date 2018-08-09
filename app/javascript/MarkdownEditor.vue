<template>
  <div class="columns">
    <div class="column">
      <textarea v-model="markdown" rows="35" class="textarea" :name="inputName" placeholder="start writing your note..." />
    </div>
    
    <div class="column">
      <div class="markdown-body" v-html="compiledMarkdown"></div>
    </div>
  </div>
</template>


<script>
import marked from 'marked'

export default {
  props: ['object', 'name', 'value'],
  data () {
    return {
      markdown: this.value      
    }
  }, 
  computed: {
    compiledMarkdown() {
      return marked(this.markdown)
    },
    inputName() {
      if (this.object) {
        return `${this.object}[${this.name}]`
      } else {
        return this.name
      }
    }
  }
} 
</script>