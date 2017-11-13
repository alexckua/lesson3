class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_user
    @current_user ||= User.find_by(token: session[:user_token])
  end

  def gravatar_user_image
    current_user ? Gravatar.new( current_user.email ).image_url : false
  end

  def is_my_message?(message)
    current_user&.id === message.user&.id
  end

  helper_method :is_my_message?
  helper_method :current_user
  helper_method :gravatar_user_image
end
