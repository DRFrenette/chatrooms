class Chatroom < ApplicationRecord
  has_many :chatroom_memberships
  has_many :users, through: :chatroom_memberships
  has_many :messages
end
