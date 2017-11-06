Rails.application.routes.draw do
  resource :session, only: [:create, :destroy]
  resource :chat, only: :show
  resource :welcome, only: :index
  resource :message, only: [:create, :destroy]
  post 'messages/:id/like', to: 'messages#like', as: :like_message
  post 'messages/:id/dislike', to: 'messages#dislike', as: :dislike_message
  delete 'messages/:id/destroy', to: 'messages#destroy', as: :destroy_message
  patch 'messages/:id/edit', to: 'messages#edit', as: :edit_message
  post 'messages/:id/edit', to: 'messages#update', as: :update_message
  root 'welcome#index'
end
