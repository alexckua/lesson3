Rails.application.routes.draw do
  resource :session, only: [:create, :destroy]
  resource :chat, only: :show
  post 'chat' => 'chats#show'
  resource :welcome, only: :index
  resources :messages, only: [:create, :edit, :update, :destroy] do
    post ':vote', action: :vote, on: :member, as: :vote, constraints: { vote: /(like|dislike)/ }
  end
  root 'welcome#index'
end
