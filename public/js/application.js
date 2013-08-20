$(document).ready(function() {
  $("form.tweet").on("submit", function(event){
    event.preventDefault();
    form = $(this).serialize();
    $.post('/send', form, function(message){
      $(this).remove();
      $('body').append(message);
    });
  });
});
