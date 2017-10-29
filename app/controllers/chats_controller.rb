class ChatsController < ApplicationController
  before_action :require_user

  def chat_messages
    Message.all
  end

  helper_method :chat_messages

  private

  def require_user
    redirect_to root_path, notice: 'You\'re not logged! Please login at first.' unless current_user
  end

end
