class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_user
    @current_user = User.find_by(token: session[:user_token])
  end

  def gravatar_user_image
    current_user ? Gravatar.new( current_user.email ).image_url : false
  end

  helper_method :current_user
  helper_method :gravatar_user_image
end
