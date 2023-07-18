Rails.application.routes.draw do
  resources :boards, only: [:show, :new, :create, :index]
  root to: 'boards#new'
end
