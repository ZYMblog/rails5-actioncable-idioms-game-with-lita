class ChatsController < ApplicationController
  def index
    @chats = Chat.all
    @chat = Chat.find_or_create_by(title: '成语接龙')
    @message = Message.new
    @messages = Message.where('(user_id = ? and target_user_id = ?) or (user_id = ? and target_user_id = ?)', current_user.id, lita.id, lita.id, current_user.id).includes(:user)
    # Chat.find_or_create_by(title: '成语接龙1')
    # @chats = Chat.find_or_create_by(title: '成语接龙2')
  end

  # def show
  #   @chat  = Chat.find(params[:id])
  #   # @chat = Chat.find_or_create_by(title: '成语接龙')
  #   # user = Chat.find_or_create_by(username: params[:username])
  #   # @chats = Chat.find_or_create_by(title: '成语接龙1')
  #   # @chats = Chat.find_or_create_by(title: '成语接龙2')
  #   # @chats = Chat.find_or_create_by(title: '成语接龙1')
  #   # @chats = Chat.find_or_create_by(title: '成语接龙2')
  # end
  private

    def message_params
      params.require(:message).permit(:content, :chat_id)
    end
end
