Rails.application.routes.draw do
  root :to =>"homes#top"
  devise_for :users

  resources :users



  resources :posts do
    resources :post_comments, only: [:create, :destroy, :edit]
    resources :bookmarks, only: [:create, :destroy]
    resources :favorites, only: [:create, :destroy]
  end

  get "users/:id/bookmarks", to: "bookmarks#index", as: :bookmark
  get "users/:id/favorites", to: "favorites#index", as: :favorite

  resources :tags do
    get 'posts', to: 'posts#search'
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
