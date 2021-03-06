/* eslint no-console:0 */
// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
//
// To reference this file, add <%= javascript_pack_tag 'application' %> to the appropriate
// layout file, like app/views/layouts/application.html.erb

import Vue from 'vue'

import TurbolinksAdapter from 'vue-turbolinks';
Vue.use(TurbolinksAdapter)

import Buefy from 'buefy'
Vue.use(Buefy)

import PasswordField from '../PasswordField.vue'
import SearchField from '../SearchField.vue'
import MarkdownEditor from '../MarkdownEditor.vue'

document.addEventListener('turbolinks:load', () => {
  window.vm = new Vue({
    el: '[data-behaviour="vue"]',
    components: {
      PasswordField,
      SearchField,
      MarkdownEditor      
    }
  })
})