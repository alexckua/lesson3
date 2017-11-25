class ChatChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'chat'
    set_user_status(true)
  end

  def unsubscribed
    set_user_status(false)
  end

  private

  def set_user_status(online)
    if current_user
      current_user.update_attribute(:online, online)
      ActionCable.server.broadcast 'chat', { user_id: current_user.id, action: :user_online, res: ApplicationController.new.render_to_string(template: 'messages/online_users', locals: { online: online, :@user => current_user }) }
    end
  end

end
