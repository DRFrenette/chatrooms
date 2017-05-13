class Chatroom < ApplicationRecord
  has_many :chatroom_memberships, dependent: :destroy
  has_many :users, through: :chatroom_memberships
  has_many :messages

  scope :public_channel,  -> { where(private_channel: false) }
  scope :private_channel, -> { where(private_channel: true) }
end
