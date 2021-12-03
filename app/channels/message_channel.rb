class MessageChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    stream_from 'messages'
  end

  def send_message(data)
    current_user = User.first if current_user.blank?
    message = Message.new(user: current_user,
      chat_id: data['chat_id'],
      content: data['text']
    )
    if message.save
      ActionCable.server.broadcast("user: self.user.username",
        message: render_message(message)
      )
    end
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
  private
  def render_message(message)
    ChatsController.render partial: 'messages/message', locals: {message: message}
  end
end