<template>
  <div class="field has-addons">
    <p class="control is-expanded">
      <b-input v-model="password" :value="value" :name="inputName"/>
    </p>
    <button @click.prevent="generate" v-if="this.password === ''" class="button is-primary">Generate</button>
  </div>
</template>

<script>
import generatePassword from 'password-generator'

export default {
  props: ['object', 'name', 'value'],
  data () {
    return {
      password: this.value
    }
  },
  computed: {
    inputName() {
      if (this.object) {
        return `${this.object}[${this.name}]`
      } else {
        return this.name
      }
    }
  },
  methods: {
    generate () {
      this.password = generatePassword(48, false, /[\da-z]/i)
    }
  }
}
</script>
