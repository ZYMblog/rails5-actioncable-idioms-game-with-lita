class MessagesController < ApplicationController
  def create
    message = Message.new(message_params)
    message.user = current_user
    message.target_user_id = lita.id
    if message.save!
      head :ok
    end
  end

  private

  def message_params
    params.require(:message).permit(:content, :chat_id)
  end
end
