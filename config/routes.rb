Rails.application.routes.draw do
  resource :session, only: [:create, :destroy]
  get 'search', :to => 'search#show', :as => 'search_message'
  resource :chat, only: :show
  post 'chat' => 'chats#show'
  resource :welcome, only: :index
  resources :messages, only: [:create, :edit, :update, :destroy] do
    post ':vote', action: :vote, on: :member, as: :vote, constraints: { vote: /(like|dislike)/ }
  end
  resources 'forgot_password', only: [:new, :create, :edit, :update], :path => 'forgot-password'
  root 'welcome#index'
end
