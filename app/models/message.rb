class Message < ApplicationRecord
  require "obscenity/active_model"

  belongs_to :chatroom
  belongs_to :user

  validates_presence_of :body, :chatroom, :user
  validates :body, obscenity: { sanitize: true }, if: :public_message?

  private

  def public_message?
    if chatroom.present?
      !chatroom.private_channel
    end
  end
end
