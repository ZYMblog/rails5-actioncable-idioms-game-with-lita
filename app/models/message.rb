class Message < ApplicationRecord
    belongs_to :chat
    belongs_to :user
    before_save :strip_content
    after_create_commit :broadcast_and_lita_auto_reply

    private

  def strip_content
    self.content = self.content.to_s.strip
  end

  def broadcast_and_lita_auto_reply
    lita = User.find_by(username: 'lita')
    if self.user != lita
      ActionCable.server.broadcast('messages', message: self.content, user: self.user.username)
      sleep 1
      cy = Idiom.find_by(name: self.content)
      # ActionCable.server.broadcast('messages', message: self.content, user: self.user.username)
      if cy.present?
        contents = Idiom.where('name like ?', "#{cy.name[-1]}%").pluck(:name).sample(5)
        content = contents.map do |word|
          "<a href='https://www.zdic.net/hans/#{word}' target='_blank'>#{word}</a>"
        end.join(' ')
        content = content.present? ? content : "无#{cy.name[-1]}开头的成语"
      else
        content = '请输入成语'
      end
      message = Message.create(content: content, user_id: lita.id, target_user_id: self.user_id, chat_id: self.chat.id)
      ActionCable.server.broadcast('messages', message: message.content, user: message.user.username)
    end
  end
end
