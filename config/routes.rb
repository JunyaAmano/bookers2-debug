Rails.application.routes.draw do
  devise_for :users

  resources :users, only: [:show, :index, :edit, :update , :create]
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :relationships, only: [:create, :destroy]
  resources :books do
    resources :post_comments, only: [:create, :destroy]
    resource :favorite, only: [:create, :destroy]
  end

  root 'home#top'
  get 'home/about' => 'home#about'
  get 'search' => 'searches#search'
end