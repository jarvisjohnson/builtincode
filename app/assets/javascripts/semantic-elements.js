document.addEventListener("turbolinks:load", function() {

  $('.ui.checkbox')
    .checkbox()
  ;

  $('.message .close').on('click', function() {
    $(this).closest('.message').fadeOut();
  });

  $('.ui.dropdown')
    .dropdown()
  ;  

  $('.ui.accordion')
    .accordion()
  ;  

});