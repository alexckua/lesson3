class ChatsController < ApplicationController
  before_action :require_user

  private

  def chat_messages
    Message.all.includes(:user).order('created_at ASC')
  end
  helper_method :chat_messages

  def require_user
    redirect_to root_path, notice: 'You\'re not logged! Please login at first.' unless current_user
  end

end
