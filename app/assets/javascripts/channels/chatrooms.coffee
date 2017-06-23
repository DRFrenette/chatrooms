App.chatrooms = App.cable.subscriptions.create "ChatroomsChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    active_chatroom = $("#chatroom[data-chatroom-id='#{data.chatroom_id}']")
    current_user_id = $("#signed-in-as").attr("data-current-user-id")

    if `current_user_id == data.sender.id`
      message_html = "<div class='col_one_third'></div>" +
      "<div class='col_two_third col_last'>
        <div class='message your_message'>
          <div class='username'>#{data.sender.name}</div>

          <div class='body'>#{data.message.body}</div>
          <div class='details'>#{data.message.timestamp}</div>
        </div>
      </div>"
    else
      message_html = "<div class='col_two_third'>
                        <div class='message someone_elses_message'>
                          <div class='username'>#{data.sender.name}</div>

                          <div class='body'>#{data.message.body}</div>
                          <div class='details'>#{data.message.timestamp}</div>
                        </div>
                      </div>"

    divider = "<div id='last-read-div' class='divider divider-short divider-center'>
                 <i class='icon-crop'></i>
               </div>"

    if active_chatroom.length > 0
      if document.hidden
        if $('.divider').length == 0
          active_chatroom.append(divider)

        if Notification.permission == "granted"
          new Notification(data.message.sender, body: data.message.body)

      else
        App.last_read.update(data.chatroom_id)

      active_chatroom.append(message_html)
      window.scrollTo(0,document.body.scrollHeight);

    else
      $("i", "#chatroom_link_#{data.chatroom_id}").show()

  send_message: (chatroom_id, message) ->
    @perform "send_message", {chatroom_id: chatroom_id, body: message}
