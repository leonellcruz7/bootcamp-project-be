Rails.application.routes.draw do
namespace :api do
  namespace :v1 do
    resources :users, param: :username

    post '/users/login', to: 'users#login'
    resources :posts
    post "/posts/search", to: "posts#search"
    post '/posts', to: 'posts#get_by_tags'
    post '/posts/upvote/:id', to: 'posts#upvote'
    post '/posts/downvote/:id', to: 'posts#downvote'
    post '/comments/upvote/:id', to: 'comments#upvote'
    post '/comments/downvote/:id', to: 'comments#downvote'
    resources :comments
    resources :replies
  end
end
end
