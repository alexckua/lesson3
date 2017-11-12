class ChatsController < ApplicationController
  before_action :require_user

  private

  def message
    @message ||= Message.new
  end
  helper_method :message

  def chat_messages
    if params[:search] && !params[:search].blank?
      Message.where("text LIKE ?", "%#{params[:search]}%").includes(:user).order(created_at: :asc).page(1)
    else
      Message.all.includes(:user).order(created_at: :asc).page(params[:page]).per(20)
    end
  end
  helper_method :chat_messages

  def require_user
    redirect_to root_path, notice: 'You\'re not logged! Please login at first.' unless current_user
  end

end
