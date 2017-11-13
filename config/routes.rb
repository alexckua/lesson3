Rails.application.routes.draw do
  resource :session, only: [:create, :destroy]
  resource :chat, only: :show
  post 'chat' => 'chats#show'
  resource :welcome, only: :index
  resources :messages, only: [:create, :edit, :update, :destroy] do
    post :vote, on: :member
  end
  root 'welcome#index'
end
