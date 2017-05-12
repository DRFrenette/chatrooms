class LastReadChannel < ApplicationCable::Channel
  def update(data)
    chatroom_membership = current_user.chatroom_memberships.find_by(chatroom_id: data["chatroom_id"])
    chatroom_membership.update(last_read_at: Time.zone.now)
  end
end
