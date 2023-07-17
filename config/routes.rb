Rails.application.routes.draw do
  resources :boards, only: [:show, :new, :create]
  root to: 'boards#new'
end
