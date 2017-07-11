class Message < ApplicationRecord
  require "obscenity/active_model"

  belongs_to :chatroom
  belongs_to :user

  validates :body, presence: true
  validates :body, obscenity: { sanitize: true }, if: :public_message?

  private

  def public_message?
    !chatroom.private_channel
  end
end
