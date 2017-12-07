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
      current_user.update_attribute(:last_online, Time.now)
      ChatUpdateJob.set(wait: 5.seconds).perform_later('set_user_status', [current_user, online_status])
    end
  end

end