class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_user
    @current_user = User.find_by(token: session[:user_token])
  end
  helper_method :current_user
end
