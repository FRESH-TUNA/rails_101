Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # resources :comments
  # resources :posts do
  #   resources :comments
  # end

  # post 'posts/:post_id/comments/:comment_id', to: 'comments#create'
  root 'posts#index'

  scope shallow_prefix: "post" do
    resources :posts do
      resources :comments, shallow: true do
        post 'create'
      end
    end
  end
  post 'comments/:comment_id', to: 'comments#create'
  # 관련한 기능이 없는지 알고 싶다.
end

# rails route 명령어를 통해 알수 있다.

