document.addEventListener("turbolinks:load", function() {

  $('.ui.checkbox')
    .checkbox()
  ;

  $('.message .close').on('click', function() {
    $(this).closest('.message').fadeOut();
  });

});