class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_locale

  def set_locale
    users_locale == "ua" ?  I18n.default_locale = :ua : I18n.default_locale

    I18n.locale = session[:locale] || I18n.default_locale
  end

  def users_locale
    lang_request = request.env['HTTP_ACCEPT_LANGUAGE']
    users_current_locale = HTTP::Accept::Languages.parse(lang_request)[1].locale
    users_current_locale == ("ua" || "en") ? user_locale : "en"
  end

  def current_user
    @current_user ||= User.find_by(id: cookies.signed[:user])
  end

  def gravatar_user_image
    current_user ? Gravatar.new( current_user.email ).image_url : false
  end

  def is_my_message?(message, alien)
    return false if alien
    return (message.user_id == current_user.id)
  end

  helper_method :is_my_message?
  helper_method :current_user
  helper_method :gravatar_user_image
end
