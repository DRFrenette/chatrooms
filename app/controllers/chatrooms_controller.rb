class ChatroomsController < ApplicationController
  after_action :authorize_chatroom, only: [:new, :create, :show]

  def index
    @public_chatrooms = Chatroom.public_channel.order(name: :asc)
    authorize @public_chatrooms
  end

  def new
    @chatroom = Chatroom.new
    @users = User.all.without(current_user)
  end

  def create
    @chatroom = Chatroom.new(chatroom_params)

    if @chatroom.valid?
      @chatroom.save!
      @chatroom.users << current_user
      flash.notice = "Chatrooms created."
      redirect_to chatrooms_path
    else
      redirect_to new_chatroom_path
    end
  end

  def show
    @chatroom_membership = current_user.chatroom_memberships.find_by(chatroom_id: chatroom.id)
    @message = Message.new
    @messages = chatroom.messages.includes(:user).order(created_at: :desc).
                limit(100).reverse
    @unread_messages = false
  end

  private

  def chatroom
    @chatroom ||= Chatroom.friendly.find(params[:id])
  end

  def authorize_chatroom
    authorize @chatroom
  end

  def chatroom_params
    params.require(:chatroom).permit(:name, :private_channel, user_ids: [])
  end
end
