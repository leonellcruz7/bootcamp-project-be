Rails.application.routes.draw do
namespace :api do
  namespace :v1 do
    resources :users, param: :username

    post '/users/login', to: 'users#login'
    resources :posts
    post "/posts/search", to: "posts#search"
    post '/posts', to: 'posts#get_by_tags'
    put '/posts/upvote/:id', to: 'posts#upvote'
    put '/posts/downvote/:id', to: 'posts#downvote'

    resources :comments
  end
end
end
