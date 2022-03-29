Rails.application.routes.draw do

  root :to =>"homes#top"
  devise_for :users
  
  devise_scope :user do
    get '/users', to: 'devise/registrations#new'
  end
  
  resources :users do
    resource :relationships, only: [:create, :destroy]
    get "followings" => "relationships#followings", as: "followings"
    get "followers" => "relationships#followers", as: "followers"
    get "confirm" => "users#confirm", as: "confirm"
  end

  resources :posts do
    resources :post_comments, only: [:create, :destroy, :edit, :update]
    resource :bookmarks, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end

  get "users/:id/bookmarks", to: "bookmarks#index", as: :bookmark
  get "users/:id/favorites", to: "favorites#index", as: :favorite

  get ' /tags/:id/posts', to: 'posts#search', as: :tag_posts
  get ' /tags/index', to: 'tags#index', as: :tag

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
