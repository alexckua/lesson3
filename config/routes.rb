Rails.application.routes.draw do
  resource :session, only: [:create, :destroy]
  resource :chat, only: :show
  resource :welcome, only: :index
  resource :message, only: :create
  post 'messages/:id/like', to: 'messages#like', as: :like_message
  post 'messages/:id/dislike', to: 'messages#dislike', as: :dislike_message
  root 'welcome#index'
end
