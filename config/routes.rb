Rails.application.routes.draw do
  root :to =>"homes#top"
  devise_for :users

  resources :posts do
    resources :post_comments, only: [:create, :destroy, :edit]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
