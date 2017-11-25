class ChatsController < ApplicationController
  before_action :require_user
  before_action lambda { @body_class = 'chat-page' }

  def show
    @searching = ( params[:search] ) ? true : false
    @online_users = User.where("id != ?", current_user.id).where(online: true)
  end

  private

  def message
    @message ||= Message.new
  end
  helper_method :message

  def chat_messages
    page = params[:page] ? params[:page] : Message.chat(params[:search], params[:page]).per(10).total_pages
    Message.chat(params[:search], page).per(10)
  end
  helper_method :chat_messages

  def require_user
    redirect_to root_path, notice: 'You\'re not logged! Please login at first.' unless current_user
  end

end
