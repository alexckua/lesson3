class ChatsController < ApplicationController
  before_action :require_user
  before_action lambda { @body_class = 'chat-page' }

  def show
    @online_users = User.where("id != ?", current_user.id).where(online: true)
  end

  private

  def message
    @message ||= Message.new
  end
  helper_method :message

  def chat_messages
    Message.chat(params[:page]).per(10)
  end
  helper_method :chat_messages

  def require_user
    redirect_to root_path, notice: 'You\'re not logged! Please login at first.' unless current_user
  end

end
