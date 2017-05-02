class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :chatroom_users, dependent: :destroy
  has_many :chatrooms, through: :chatroom_users
  has_many :messages

  validates :name, presence: true, uniqueness: true
end
