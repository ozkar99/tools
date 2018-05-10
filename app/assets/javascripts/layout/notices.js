document.addEventListener('turbolinks:load', function () {

  var $notificationDeletes = Array.prototype.slice.call(document.querySelectorAll('.notification-delete'), 0);

  if ($notificationDeletes.length > 0) {

    $notificationDeletes.forEach(function ($el) {
      $el.addEventListener('click', function () {
        $el.parentElement.style.display = 'none';
      });
    });
  }

});