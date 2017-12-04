class ChatChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'chat'
    set_user_status(true)
  end

  def unsubscribed
    set_user_status(false)
  end

  private

  def set_user_status(online_status)
    if current_user
      current_user.update_attribute(:online, online_status)
      ActionCable.server.broadcast 'chat', user_id: current_user.id, action: :user_online, online: online_status, message_html: ApplicationController.renderer.render(partial: 'messages/users_online', object: current_user, as: :user)
    end
  end

end