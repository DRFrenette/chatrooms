class ChatroomMembership < ApplicationRecord
  belongs_to :chatroom
  belongs_to :user

  before_create :set_last_read_at

  scope :active, -> { where(state: "accepted") }
  scope :pending, -> { where(state: "pending") }

  def accept_membership
    update(state: "accepted")
  end

  private

  def set_last_read_at
    self.last_read_at = Time.zone.now
  end
end
