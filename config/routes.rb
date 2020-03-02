Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'homes#home'

  # get '/users/:id', to: 'users#show', as: 'user'
  resources :users, only: [:show, :edit, :update]
  resources :posts, only: [:new, :create, :destroy] do
    resources :photos, only: [:create]
    resources :likes, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy]
  end
end
