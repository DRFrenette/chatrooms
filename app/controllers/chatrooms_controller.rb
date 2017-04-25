class ChatroomsController < ApplicationController
  def index
    @chatrooms = Chatroom.all
  end

  def new
    @chatroom = Chatroom.new
  end

  def create
    @chatroom = Chatroom.new(chatroom_params)

    if @chatroom.valid?
      @chatroom.save!
      flash.notice = 'Chatrooms created.'
      redirect_to chatrooms_path
    else
      redirect_to new_chatroom_path
    end
  end

  private

  def chatroom_params
    params.require(:chatroom).permit(:name)
  end
end
