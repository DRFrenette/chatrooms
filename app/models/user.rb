class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :chatroom_memberships, -> { active }, dependent: :destroy
  has_many :chatroom_invitations, -> { pending },
    class_name: "ChatroomMembership", dependent: :destroy
  has_many :chatrooms, through: :chatroom_memberships
  has_many :invited_chatrooms, through: :chatroom_invitations,
    source: :chatroom
  has_many :messages

  validates :name, presence: true, uniqueness: true
end
