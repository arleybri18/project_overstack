Rails.application.routes.draw do

  resources :users, only: [:new, :create]

  resources :questions do
    resources :comments, only: [:create]
  end
  

  
  get 'login', to: 'sessions#new'
  post 'login',to: 'sessions#create'
  delete 'logout',to: 'sessions#destroy' 

  root "questions#index"
end
