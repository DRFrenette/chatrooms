class ChatroomsController < ApplicationController
  def index
    @chatrooms = Chatroom.all
  end

  def new
    @chatroom = Chatroom.new
  end
end
