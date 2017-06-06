Chatrooms.Views.Chatroom = function() {
  $(document).on("click", function() {
    var $divider = $("#last-read-div");

    if ($divider.length > 0) {
      var chatroom_id =  $("#chatroom").attr("data-chatroom-id");
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

  $("#new_message").submit(function(e) {
    e.preventDefault();
    var $chatInput = $("#message_body")
    var chatroom_id =  $("#chatroom").attr("data-chatroom-id");
    var message_body = $chatInput.val();
    $chatInput.val("");
    App.chatrooms.send_message(chatroom_id, message_body);
  });
};
