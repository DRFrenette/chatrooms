class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :chatroom_memberships, dependent: :destroy
  has_many :chatrooms, through: :chatroom_memberships
  has_many :messages

  validates :name, presence: true, uniqueness: true
end
