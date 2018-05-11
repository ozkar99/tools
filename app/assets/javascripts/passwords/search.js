$(document).ready(function() {
  $("#password_search_input").on('keyup', _.debounce(function (e) {
    console.log(e)
  }, 1500));
});
