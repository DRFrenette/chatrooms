class ChatroomsController < ApplicationController
  after_action :authorize_chatroom, only: [:new, :create, :show]

  def index
    @chatrooms = Chatroom.all
    authorize @chatrooms
  end

  def new
    @chatroom = Chatroom.new
  end

  def create
    @chatroom = Chatroom.new(chatroom_params)

    if @chatroom.valid?
      @chatroom.save!
      flash.notice = "Chatrooms created."
      redirect_to chatrooms_path
    else
      redirect_to new_chatroom_path
    end
  end

  def show
    @chatroom = Chatroom.find(params[:id])
    @chatroom_user = current_user.chatroom_users.find_by(chatroom_id: @chatroom.id)
    @message = Message.new
    @messages = @chatroom.messages.includes(:user).order(created_at: :desc).
      limit(100).reverse
    @unread_messages = false
  end

  private

  def authorize_chatroom
    authorize @chatroom
  end

  def chatroom_params
    params.require(:chatroom).permit(:name)
  end
end
