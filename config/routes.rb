
Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do

       resources :users, :only => [:index, :show, :create]
       post '/auth', to: 'auth#create'
       get '/current_user', to: 'auth#show'
       get '/refresh', to: 'auth#refresh'
       get "/friendships/:friend_id/new", to: "friendships#create"


       resources :friendships
       resources :likes
       resources :posts, :only => [:index, :show, :create, :destroy]


    end
  end
end
