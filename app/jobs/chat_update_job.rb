class ChatUpdateJob < ApplicationJob
  queue_as :default

  def perform(message)
    ActionCable.server.broadcast 'chat', user_id: message.user_id, id: message.id, action: :create, res: ApplicationController.renderer.render(partial: 'messages/message', object: message, locals: { alien: true })
  end
end
