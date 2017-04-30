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

  // Modals, except those that need to be dynamic
  $('.ui.modal')
  .modal({
    inverted: true,
    allowMultiple: true
  })
  ;

  $('#modal__contact-options')
    .modal('attach events', '#modal__trigger__contact-options', 'show')
    // .modal('attach events', '#modal__trigger__contact-options__lower', 'show')
  ;   
  // $('#modal__contact__form-support')
  //   .modal('attach events', '#modal__contact-options .support.button')
  // ;
  // $('#modal__contact__form-enquiry')
  //   .modal('attach events', '#modal__contact-options .enquiry.button')
  // ;

  // create sidebar and attach to menu open
  $('.ui.sidebar')
    .sidebar('attach events', '.toc.item.open', 'show')
    .sidebar('attach events', '.toc.item.close', 'hide')
  ;      

});