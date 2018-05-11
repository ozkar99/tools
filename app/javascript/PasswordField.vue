<template>
  <div class="field has-addons">
    <p class="control is-expanded">
      <b-input v-model="password" :value="value" :name="name"/>
    </p>
    <button @click.prevent="generate" v-if="this.password === ''" class="button is-primary">Generate</button>
  </div>
</template>

<script>
import generatePassword from 'password-generator'

export default {
  props: ['name', 'value'],
  data () {
    return {
      password: this.value
    }
  },
  methods: {
    generate () {
      this.password = generatePassword(48, false, /[\da-z]/i)
    }
  }
}
</script>
