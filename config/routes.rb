Rails.application.routes.draw do
  root 'home#index'
  resources :users, only: [:new, :create, :show]
  resources :gifts, only: [:create, :update]
  resources :dashboard, only: [:show]

  post '/reGIFt', to: 'gifts#regift'
end
