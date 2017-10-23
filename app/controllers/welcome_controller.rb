class WelcomeController < ApplicationController
  before_action :require_guest

  def index
  end

  private

  def require_guest
    redirect_to chat_path if current_user
  end
end
