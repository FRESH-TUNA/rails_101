Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # resources :comments
  resources :posts do
    resources :comments
  end
  post 'posts/:post_id/comments/:comment_id', to: 'comments#create'
  root 'posts#index'
end

