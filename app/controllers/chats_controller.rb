class ChatsController < ApplicationController
  before_action :require_user

  private

  def message
    @message ||= Message.new
  end
  helper_method :message

  def chat_messages
    Message.chat(params[:search], params[:page])
  end
  helper_method :chat_messages

  def require_user
    redirect_to root_path, notice: 'You\'re not logged! Please login at first.' unless current_user
  end

end
