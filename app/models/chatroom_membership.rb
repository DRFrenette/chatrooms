class ChatroomMembership < ApplicationRecord
  belongs_to :chatroom
  belongs_to :user

  before_create :set_last_read_at

  private

  def set_last_read_at
    self.last_read_at = Time.zone.now
  end
end
