const { environment } = require('@rails/webpacker')
const vue =  require('./loaders/vue')
const vuecompiler = require('./vue-compiler')

environment.config.merge(vuecompiler)
environment.loaders.append('vue', vue)
module.exports = environment
