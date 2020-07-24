const { environment } = require('@rails/webpacker')
const vue =  require('./loaders/vue')
const vuecompiler = require('./vue-compiler')
const VueLoaderPlugin = require('vue-loader/lib/plugin')

environment.config.merge(vuecompiler)
environment.loaders.append('vue', vue)
environment.plugins.append('VueLoaderPlugin', new VueLoaderPlugin())
module.exports = environment
