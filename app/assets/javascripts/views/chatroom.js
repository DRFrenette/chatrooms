$(document).on('turbolinks:load', function() {
  $('#new_message').keyup(function(e) {
    if (e && e.keyCode == 13) {
      e.preventDefault();
      return false;
      $(this).submit();
    };
  });
});
