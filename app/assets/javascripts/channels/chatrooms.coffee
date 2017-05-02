App.chatrooms = App.cable.subscriptions.create "ChatroomsChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    active_chatroom = $(".messages#chatroom_#{data.chatroom_id}")

    message_html = "<a class='list-group-item' href='#'>" + 
    "<b>#{data.message.sender}</b>" +
    " (#{data.message.timestamp} ): #{data.message.body}"

    if active_chatroom.length > 0
      active_chatroom.append(message_html)

      if document.hidden && Notification.permission == "granted"
        new Notification(data.message.sender, body: data.message.body)
    else
      $("i", "#chatroom_link_#{data.chatroom_id}").show()
