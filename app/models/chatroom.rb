class Chatroom < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  has_many :chatroom_memberships, dependent: :destroy
  has_many :users, through: :chatroom_memberships
  has_many :messages

  validates :name, presence: true, uniqueness: true

  scope :public_channel,  -> { where(private_channel: false) }
  scope :private_channel, -> { where(private_channel: true) }
end
