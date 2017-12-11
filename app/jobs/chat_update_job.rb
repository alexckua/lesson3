class ChatUpdateJob < ApplicationJob
  queue_as :default

  def perform(action_name, args)
    self.send(action_name.to_sym, *args) if self.respond_to?(action_name.to_sym, :include_private)
  end

  private

  def create(message)
    ActionCable.server.broadcast 'chat', user_id: message.user_id, id: message.id, message_text: message.text, user_image: message.user.gravatar_url, action: :create, res: ApplicationController.renderer.render(partial: 'messages/message', object: message, locals: { alien: true })
  end

  def update(message)
    ActionCable.server.broadcast 'chat', user_id: message.user_id, id: message.id, action: :update, res: ApplicationController.renderer.render(partial: 'messages/message', object: message, locals: { alien: true })
  end

  def vote(message, user)
    ActionCable.server.broadcast 'chat', user_id: user.id, id: message.id, action: :vote, res: message
  end

  def destroy(message_id)
    ActionCable.server.broadcast 'chat', id: message_id, action: :delete
  end

  def set_user_status(user, online_status)
    elapsed_seconds = Time.now - user.last_online
    if elapsed_seconds > 5
      ActionCable.server.broadcast 'chat', user_id: user.id, action: :user_online, online: online_status, message_html: ApplicationController.renderer.render(partial: 'messages/users_online', object: user, as: :user)
    end
  end

end
