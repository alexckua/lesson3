class SessionsController < ApplicationController
  def create
    @user = User.create(user_params)
    session[:user_token] = @user.token
    redirect_to chat_path, notice: 'Logged In'
  end

  def destroy
    reset_session
    redirect_to :root
  end

  private

  def user_params
    params.require(:user).permit(:email, :name)
  end
end
