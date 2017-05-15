$(document).on('turbolinks:load', function() {
  $(document).on('click', function() {
    var $divider = $('.divider')

    if ($divider.length > 0) {
      chatroom_id = $('.messages').attr('id').match(/\d+/);
      App.last_read.update(chatroom_id);
      $divider.remove();
    };
  });

  $('#new_message').keyup(function(e) {
    if (e && e.keyCode == 13) {
      e.preventDefault();
      return false;
      $(this).submit();
    };
  });
});
