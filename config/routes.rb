
Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do

       resources :users, :only => [:index, :show, :create]
       resources :comments, :only => [:index, :show, :create, :edit, :delete]


       post '/auth', to: 'auth#create'
       get '/current_user', to: 'auth#show'
       get '/refresh', to: 'auth#refresh'
       get "/friendships/:friend_id/new", to: "friendships#create"


       resources :friendships

       resources :posts, :only => [:index, :show, :create, :destroy]


    end
  end
end
