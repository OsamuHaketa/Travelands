Rails.application.routes.draw do
  root :to =>"homes#top"
  devise_for :users

  resources :users

  resources :posts do
    resources :post_comments, only: [:create, :destroy, :edit]
    resource :bookmarks, only: [:create, :destroy]
  end

  resources :tags do
    get 'posts', to: 'posts#search'
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
