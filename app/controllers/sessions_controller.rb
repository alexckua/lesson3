class SessionsController < ApplicationController
  def create
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
    reset_session
    redirect_to :root, notice: 'You\'re logged out'
  end

  private

  def user_params
    params.require(:user).permit(:email, :name)
  end
end
