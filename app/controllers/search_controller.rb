class SearchController < ApplicationController
  before_action lambda { @body_class = 'search-page' }

  def show
  end

  private

  def chat_messages
    @messages ||= Message.search(params[:q]).includes(:user).order(id: :asc)
  end
  helper_method :chat_messages

  def search_query
    params[:q]
  end
  helper_method :search_query

end
