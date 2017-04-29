class MessagesController < ApplicationController
  def create
    message = chatroom.messages.new(message_params)
    message.user = current_user

    if message.save
      redirect_to chatroom
    else
      #cry
    end
  end

  private

  def message_params
    params.require(:message).permit(:body)
  end

  def chatroom
    @chatroom ||= Chatroom.find(params[:chatroom_id])
  end
end
