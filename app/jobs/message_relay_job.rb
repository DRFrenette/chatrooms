class MessageRelayJob < ApplicationJob
  queue_as :default

  def perform(message)
    ActionCable.server.broadcast("chatrooms:#{message.chatroom_id}", {
                                 message: {
                                   body: message.body,
                                   sender: message.user.name,
                                   timestamp: message.created_at.strftime("%l:%M %p")
                                 },
                                 chatroom_id: message.chatroom_id
    })
  end
end
