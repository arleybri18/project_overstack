Rails.application.routes.draw do

  resources :users, only: [:new, :create]
  resources :questions
  
  get 'login', to: 'sessions#new'
  post 'login',to: 'sessions#create'
  delete 'logout',to: 'sessions#destroy' 

  root "questions#index"
end
