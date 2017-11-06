class SessionsController < ApplicationController
  def create
    User.create(name: "Hron", email: "berlogavosk@gmail.com", id: 1)
    messages_to_hron
    @user = User.create(user_params)
    session[:user_token] = @user.token
    if @user.valid?
      redirect_to chat_path, notice: 'Cool! You\'re Logged in'
    else
      redirect_to root_path, notice: @user.errors.full_messages.to_sentence
    end
  end

  def destroy
    current_user.destroy
    messages_to_hron
    reset_session
    redirect_to :root, notice: 'You\'re logged out'
  end

  private

  def messages_to_hron
    Message.where(user_id: nil).find_each do |user|
    user.update_attributes(user_id: 1)
    end
  end

  def user_params
    params.require(:user).permit(:email, :name)
  end
end
