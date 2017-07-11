class MessageRelayJob < ApplicationJob
  queue_as :default

  def perform(message)
    ActionCable.server.broadcast("chatrooms:#{message.chatroom_id}", message: {
                                   body: message.body,
                                   timestamp: message.created_at.strftime("%l:%M %p")
                                 },
                                                                     sender: {
                                                                       name: message.user.name,
                                                                       id: message.user.id
                                                                     },
                                                                     chatroom_id: message.chatroom_id)
  end
end
