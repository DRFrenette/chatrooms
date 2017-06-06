App.chatrooms = App.cable.subscriptions.create "ChatroomsChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    active_chatroom = $(".messages#chatroom_#{data.chatroom_id}")

    message_html = "<a class='list-group-item' href='javascript:void(0)'>" + 
    "<b>#{data.message.sender}</b>" +
    " (#{data.message.timestamp} ): #{data.message.body}"

    divider = "<div class='divider divider-short divider-center'>" +
    "<i class='icon-crop'></i></div>"

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
