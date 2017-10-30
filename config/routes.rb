Rails.application.routes.draw do
  resource :session, only: [:create, :destroy]
  resource :chat, only: :show
  resource :welcome, only: :index
  resource :message, only: :create
  root 'welcome#index'
end
